Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DFD311C35
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970952; cv=none; b=dPlFX7HjDNkCg7FX31oT+SJ21W8M7CwzqWuOqJnf4faU330WoLFoVm6yDH11I1XVTX6AZvrTwlifJ63cAy/ebUnVpFacTTktJUEnJ3BbGZ2HIQ/xIe/+Ll4NseN5JpyA6m9+i4fbFymWbQT7m+rThe+rbCSRWHZGjFep9V1uC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970952; c=relaxed/simple;
	bh=nCBqxP5sqd/ywO7hxySgo/z7MuNVnRmbeNezGsLL5DM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+bgx/aIzcJhlSU8z84GxPIIVVyoAo/B7Wuw68M5VPgKfyXfn68h6RZGELzeN15fr/HwMkWGCwB5Nb1E1QnGBm5f/Hx5CLbhLGViKwkqWmh8DVW1pkKDgpJI9V9GwQ4mzigDTRga+F4JlXjJ6XI2gSsvyssl0TpaS3r54ZNuLyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YCPcqNuH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YCPcqNuH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73161849e1so842137766b.2
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1767970948; x=1768575748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eh1b7PJlh1mkmaX9+zF40XSmRj4kINuJfJyjc07Wr4o=;
        b=YCPcqNuHJAMlUmlPaiMNkxEUlghWVE0Ds4M6dLz8Seo7Yu1N3WulckQTGcy2idgZOd
         ncjs3I0C6UpPa4hLzEPyeei5KMsB8aUj34B7zgIyUL81kACxyIfTJvoGaiS8Pz2R5dA3
         rmlKOgTanyRMFpUU6BDJoxzK9aAEx7Lpp80JptTtHu84H/8IXtjFkJnmLdncmjOb5vig
         aK/IsM7zRFFfMkFWdU7XzVvZxq7q/ivnRN3bKpScwBEmS+cGYCb+k1+jN+9NlR3kc19J
         OJXjSgTdyTUcgArxtCCMiwwgpzECJC3mgFLY7xuLEZGftAx1ZeoecsADwPb5dNmhW3vY
         LjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970948; x=1768575748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eh1b7PJlh1mkmaX9+zF40XSmRj4kINuJfJyjc07Wr4o=;
        b=dVAs0axBEnY62je8Mcnaa8f5jy9PTEQRWngHudFl7d5UJ162EO3xraSYWRJv6e5vWD
         aYU30qu4Dt1zfLzFQBPjl2sQHOCR1lXkftBkQ6iXe8Fd8de7hyjhjOva+FTyt1ZP5jvd
         LDPssVMDKy0AC9EshzMXbp8lkgJMe6mBgEkN+VeFzIaAJCjdvMcAQwaSQBxJQZMR5bZq
         8hzAiS3Oet/XFqTbuKNB8q07za8d9RoYKSCaZ+dH1Fjplg3eoazryytMuruvDEga3OJL
         U8782pgSx0bvXs7wBCt6EwdDabYkM6lAt2xTT+pgd++fXRm07m03iFvIodS4eCesxrHV
         MpkA==
X-Forwarded-Encrypted: i=1; AJvYcCVaONSkBGScAi1YMSeUP56U2ECBoihRxzxRIIA8AynrPIOSdg5dePgtGQPYfnleUucXEN0ltTxItDu90w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4xsB+gqMiu5ropgOfhug4KtUMq3MVG6p4JrplRnZ6gPOj5zP+
	pPZC4tnM5VQV5XAkdjbnWSK6YubEEGqSneJ9z9J6zDqBSgegx3eekhmxOv3ADZxPGFU=
X-Gm-Gg: AY/fxX4E5s5ETuPvDqGs88ePm/NCORZtFvovu55uqoGqueVUjcBdfJO4tbuK+48W94F
	UPwiTZLJ+JBZxqsRfqQeqO+XXTfS3Pj1tHd/poaVyJHlJoUoJZ4L0tYF4kvDJYx+5l1y5Fzy9i5
	rDp9qGKSRPU5cJtzJadtAtdfhEFP/ALLgl/Jb/tZYLSCEMWvjAJyx+c1ZfUTOj7keCjzduLb08Z
	mWzMll6sHh6nWSol+TKlZ0FD1JfOn+bbUzBj6Xop55/T/begAL4c6ZU8iVYebkcK+aubd09X+XQ
	5gveStlcw71/IWdSje/QFOyvWY0nXoQIjziYYGTC8k+cpcqvBS0klnB8wNDUMWzLzKeQkW1lXuU
	J5iG4OG5J2wCX0YlDVS0FSDtmaTsTS1GWfJrTOSF2hxK68i4Zbobr8FsGH8t+z9Excv8fxy9seo
	Hzk+1lTcM/YIFTIPp1KwCioUfHG1AqOBiW/uxhcYJyG7qvFXhhjpxNxW2FqZcOXx1Z
X-Google-Smtp-Source: AGHT+IHFXaqkqUvJibSzS1JQRooC7jLomB5BmheUGAePTs8yM3pFtmiu+UW+F11F/cwtA4H1dqY/AA==
X-Received: by 2002:a17:907:3fa3:b0:b7d:406f:2d3d with SMTP id a640c23a62f3a-b84453fc81amr1073349766b.54.1767970946746;
        Fri, 09 Jan 2026 07:02:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a511546sm1132090766b.48.2026.01.09.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:02:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Jan 2026 16:02:05 +0100
Subject: [PATCH 1/2] ASoC: codecs: aw88261: Remove AW88261_I2C_NAME macro
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-aw88261-dt-v1-1-45840c7632a3@fairphone.com>
References: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
In-Reply-To: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767970945; l=1369;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=nCBqxP5sqd/ywO7hxySgo/z7MuNVnRmbeNezGsLL5DM=;
 b=wfZz4y2xYmwI3It8e/xiHU5Prd79hzi8oRx/wgI/iQUyo3PgzFLcrAkvZb/BG6o2zoOPYOnKw
 XjVtdh/c8I2B/Ee+rf87dF6zrHTATOMjd5ihmyaG7GBO6Oytrjr11Bd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Replace the macro by its simple string value, to make the code less
unnecessarily complicated.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/aw88261.c | 4 ++--
 sound/soc/codecs/aw88261.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 8f37bfb974ae..ceea0c8c60b1 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1264,14 +1264,14 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88261_i2c_id[] = {
-	{ AW88261_I2C_NAME },
+	{ "aw88261" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
 
 static struct i2c_driver aw88261_i2c_driver = {
 	.driver = {
-		.name = AW88261_I2C_NAME,
+		.name = "aw88261",
 	},
 	.probe = aw88261_i2c_probe,
 	.id_table = aw88261_i2c_id,
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index 734d0f93ced9..1fee589608d6 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -370,8 +370,6 @@
 #define AW88261_START_RETRIES		(5)
 #define AW88261_START_WORK_DELAY_MS	(0)
 
-#define AW88261_I2C_NAME		"aw88261"
-
 #define AW88261_RATES (SNDRV_PCM_RATE_8000_48000 | \
 			SNDRV_PCM_RATE_96000)
 #define AW88261_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \

-- 
2.52.0

