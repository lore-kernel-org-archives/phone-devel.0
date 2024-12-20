Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE420468C
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697337; cv=none; b=gA6Jf9WIehUkmy5xxuDh6d4pCLKujKhZwufMYVg2Of4TCV3AlPEtVzfa99D4YxASsKXVZxJ964OtUcGyKMisBCR31lH4XjYdV9f2rHTdRdihBM69NJvFJP0ZU5ZTSxuCqsO2WW7K/re6hpxQJCbQIngFXTIqmZzIXegXsUoT8J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697337; c=relaxed/simple;
	bh=qx5p/hDbUkuDZtzddbNWpM0QTt2rSGt/pmcZqagYCts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F84pb/SLm/szhoNU4GCUkuvh7r0b8RxcTTKU9rQcxQEiotfZOUiFV54Yd0SRStJLkrCnk21ne16F7e7GD3iNzw5F6VH2IpMtFtYz/VqItkdPS5btcKKXL3XvXibCq4TlGSOnnxEVDXLPp0XYlHOiwhomrtr8ETPM3M4p8ylf2dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yNe1M87h; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yNe1M87h"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa670ffe302so352451966b.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 04:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734697333; x=1735302133; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dVIs/A5zO1lF6Hvf56Jf96I1JylRoUAYB/UjCgUI+Ws=;
        b=yNe1M87hI4shQl5xbvB5lfiFPX8AzZmee9d8Y/Qjy2JqC1Ws+mK3zlWN5TEW7NuYkr
         MfHh5/GpW0ET11M3A/9CO9GevuavAJlWy+H46RjyU0kOpuO+LCiaT1HT32pXIowmrMEt
         5ibW/d6SA+j1srgNYxGclQzDQtDufNO8GuNLjh4u8wE+xG6HcTBa4+toGaFmrTt+g/x6
         uxFpTLtXIkJ0ipoAwgYC+OJjAfzmlBdfy0LF3fW+WTjTiCvDG3F8RfNj0wnMInu77edQ
         Q1Utfk1POeg0y1Yc5V5d00b1Oontqwwvi5wYjTcXxKfL/zi8e6DKbRzCiri0FnzikYHL
         oTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697333; x=1735302133;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVIs/A5zO1lF6Hvf56Jf96I1JylRoUAYB/UjCgUI+Ws=;
        b=RiVjEENTTL+G05mAPnw2XKorv2rfN171Z3x5lLEUeID6jmxlXm+XwgQIsWqCfMI0zS
         eIJeZB7nsmk4WN/O9kcn0nNwtdjjrTLd1mrrO8pb1v5G7n7FSu03mlwuV7tpH68A8Ekt
         Ip5bJLC02133RVnR/1EXEPiPZCr7rWtmDG6IS2zHZvMmR8+pU33GHia5ycn8wZWp6Egj
         iyV+yQGZf63AVTQaV5/JuglmXebvENyPdLaozWZ/kOPo3ewsK3qqlyuKON+Xcv+V12sJ
         4r01v+zmS7gesnXykhRKecWTJ31ajwFRfK+xj3C338R7BM/7KRzdw+JJ52Z8oux40eBR
         Frwg==
X-Forwarded-Encrypted: i=1; AJvYcCVUp7RTEOfCANGjRY8AEapUdWslXLIH+UOVF5aUbT3MYO3HCtDzv8DnZWP+lBK68H4ynACsJ0MWMdXfsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGSH+pWU2bE1mbPD0nMtxKuHs96B5EA1iLSU0clQ5JraepPSb
	cVaYczVrHtfn9H8NISooLlphpcJySAEf9WIbckSFTXAeobYS3hAxmtV12lh4DHg=
X-Gm-Gg: ASbGncuG5wQK/aACpwE4qDZeorDRwTJWGa550mLkb+9DqwYqCEnAJoFE/2+r0z5erlq
	Nx5rPBv9NlzW1PfajTpOyyR1LqicS1RTAikCMmiOmgzXLpUDYEqMyn5vUwVZqi9U7vtW0Ymro/b
	p5JRCUNDETIPcnuqq/clbnzt7zWa6nF6P5VOvBhzWMJjD6NuK9FYIOSrcJosahs3GlHd+KPfpRo
	pwkVt8KkzpOpDxFfZz/UuLwqSFgUB8bfnfmM9Btuez8cuMX81SKvh17lutoGj4PIU+vgWS+NMIs
	uTZvip9Lblwy46m+c7S5T5PI5rJ++A==
X-Google-Smtp-Source: AGHT+IFPG5xPXCwcvvE2JWaV4HcrHvc6W3DgQ5ZikyH58crfIMJ8TJhxYQjOiX6A2Ig+f3m0RqS6HQ==
X-Received: by 2002:a17:907:7e86:b0:aac:4ef:36de with SMTP id a640c23a62f3a-aac2b19a851mr241107266b.17.1734697333203;
        Fri, 20 Dec 2024 04:22:13 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f5f4sm171403166b.6.2024.12.20.04.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 04:22:12 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 13:22:07 +0100
Subject: [PATCH] nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAG5hZWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMD3eKUxFzd4syqVN2URLPElNRks7SkxEQloPqCotS0zAqwWdGxtbU
 Aju9aLlsAAAA=
X-Change-ID: 20241220-sdam-size-da6adec6fbaa
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shyam Kumar Thella <sthella@codeaurora.org>, 
 Anirudh Ghayal <quic_aghayal@quicinc.com>, 
 Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Let the nvmem core know what size the SDAM is, most notably this fixes
the size of /sys/bus/nvmem/devices/spmi_sdam*/nvmem being '0' and makes
user space work with that file.

  ~ # hexdump -C -s 64 /sys/bus/nvmem/devices/spmi_sdam2/nvmem
  00000040  02 01 00 00 04 00 00 00  00 00 00 00 00 00 00 00  |................|
  00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  00000080

Fixes: 40ce9798794f ("nvmem: add QTI SDAM driver")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Related, it would be nice to set sdam->sdam_config.type to an
appropriate value, the ones currently upstream are:

  enum nvmem_type {
      NVMEM_TYPE_UNKNOWN = 0,
      NVMEM_TYPE_EEPROM,
      NVMEM_TYPE_OTP,
      NVMEM_TYPE_BATTERY_BACKED,
      NVMEM_TYPE_FRAM,
  };

I don't know what would fit for SDAM and I couldn't find any info on
createpoint either, not even what the abbreviation SDAM stands for.
---
 drivers/nvmem/qcom-spmi-sdam.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index 9aa8f42faa4c93532cf8c70ea992a4fbb005d006..4f1cca6eab71e1efc5328448f69f863e6db57c5a 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -144,6 +144,7 @@ static int sdam_probe(struct platform_device *pdev)
 	sdam->sdam_config.owner = THIS_MODULE;
 	sdam->sdam_config.add_legacy_fixed_of_cells = true;
 	sdam->sdam_config.stride = 1;
+	sdam->sdam_config.size = sdam->size;
 	sdam->sdam_config.word_size = 1;
 	sdam->sdam_config.reg_read = sdam_read;
 	sdam->sdam_config.reg_write = sdam_write;

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-sdam-size-da6adec6fbaa

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

