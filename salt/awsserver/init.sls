awspkgs:
  pkg.latest:
    - pkgs:
      - openjdk-6-jre
      - build-essential
      - unzip
      - cpanminus
      - libxslt-dev
      - libxml2-dev
      - libxml2-utils
      - ruby1.8-full
      - rubygems
    - order: 1

uuidtools:
  gem:
    - installed

json:
  gem:
    - installed

httparty:
  gem:
    - installed
 
nokogiri:
  gem:
    - installed

/home/ubuntu/.aws/aws-credential-file.txt:
  file.managed:
    - source: salt://awsserver/aws-credential-file.txt
    - user: ubuntu
    - group: ubuntu
    - mode: 600
    - makedirs: True

/usr/local/aws/bin/ec2-metadata:
  file.managed:
    - source: http://s3.amazonaws.com/ec2metadata/ec2-metadata
    - user: ubuntu
    - group: ubuntu
    - mode: 755
    - makedirs: True

ec2-api-tools:
  file.managed:
    - name: /home/ubuntu/ec2-api-tools.zip
    - source: http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
    - user: ubuntu
    - group: ubuntu
    - mode: 644
  cmd.wait:
    - name: unzip ec2-api-tools.zip
    - cwd: /home/ubuntu
    - watch:
      - file: ec2-api-tools
    

