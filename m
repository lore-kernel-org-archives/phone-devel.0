Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE162BD5B3
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842940; cv=none; b=WsBXtXStUCPbBmsIaZu9XEBb2yPRlsMgaLwGWjdtmkZopRUkJpjfb6W4ljw6f0w1vsaELN/g+WXAy++ZKZD3OSWRqGQcXj1NAzxAKcov0FAhMeIHCdKbeoVkL67TyL/1hl51X47MJDW+KMJHprGsnICslQdhrYv1kT0pNgBXcxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842940; c=relaxed/simple;
	bh=vCp//gPYQcR3DNj7zr7SuBIjoFrxsV54Ke1YSaCx7AM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7Tp5NODkBp+q4ZWWuyQjySgL2S52jM6ELDKFVIEtt1CjxFqB7dOaxrx6rEWo55fdyVk+o/czkPmgL7WRfYUHDGBIZHB9ShQNBH36DUbG7MFkWSpre0drMK9CWTrWdcuIFRlV40v2qNYmqKBMyLaGAPgrpVFXspN48qPQ2uP1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SM3O5nFR; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SM3O5nFR"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad574992fcaso1124093166b.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842937; x=1751447737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+LGnTNcVQ28XMxEvYu54IUxPobup7v+2rWujowv9BA=;
        b=SM3O5nFRQHEsv8VN0Cmmh9NTOVterKyDltoX7QgHtBeQ00m5a5L1+BgTIr6r0huxp6
         Xr6VS73kc9bTFrNyX9cHB08T/7aTRxdvnIce6wl5K0bnK1XYOdTgoGDnsrUcGQqWIwMZ
         MysajJGPnFaH/GMbw3lOIhZGCFzOXgiPS4IST+n7qJACcsy3cDVN3UTw+Uimad8Ouqus
         +reNjDhOqyqrvEY4BYi7bkIPYpM6sw3/89+O9C4O0xJUoyJtDd+asMtJDiapz/yciLPU
         Svc9tWHO3FlhHL4wfqJ/DBd18kS2D5pg6d+gGmOEi59CQ72BL3bX2adln7dbfML+S913
         tw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842937; x=1751447737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+LGnTNcVQ28XMxEvYu54IUxPobup7v+2rWujowv9BA=;
        b=KsLZ+RjN9sKyNzKSWHWe+LPz48OQZ0gFabizzqAifBRQJ0rc5JYLlyg6ut0G2gUzv1
         1xDn6c1NeMZ6GNryOotBeMsIjoAjcCbsMjGGQeQw3/Gk3ACMpJDNK8sYyHp7nOlQtWaN
         0kYCuzIO4dOF0vv9F6cFWSUBPYwa6EAkfnEzlaaBi5ZGcgAUoGc5D4Xq0fkKD8YIApTB
         pj0tRakYZEsIFzdoNNNZ9TJiy5Gf23zhh6tphRi+Kvh/TmT2szam3Dvn7Pn8HOvjEhpT
         6PPbUZfHZScwjbEOSCaXmtGhWcEZNhX3iy5hzwVCOMngGjNMqs83ie8jXHS3i8qSft3y
         HIwA==
X-Forwarded-Encrypted: i=1; AJvYcCWlivbCOqrQ8X37QLbJELCuT9Kzua07KnpQ3JiGw9a1p6/ROV9SbY8WUX3pDbvokwNYGTvrRs4oFWKLaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQGfSZthfqyr2NpVmYisyUvLRS7n9LMY7nMF1GSVh8Rwckqi8
	GlhEqVIsrMsPn1c3+7oxWnf77imlm64d3qMoOJKVTWihmKXWUd9UdE2MqfxmsFccC9Y=
X-Gm-Gg: ASbGncvDt5Bag/tS6n3IvjDlE8kzqnH01t3RxkDiM0gfovp1ZkejIh1TNFX6lT0FSAx
	WYFSloVqJhia5wH2K+9DyPrAhiBas0vGqjwr3KNGpBl8f9Of6Jr4/fhRALHz7jIAwHiAlKoy994
	O+e445QTfJEsL/svLI2LQKLJmGnm3bdDlghcW1Aq6/ii4hLED9ufL9j83uLk+Oe5uSGTiGjdGLq
	cUYcPFd27urYxuXKcctngDDYlTjyBXJNxSrBI7sxxfXqUbI7uUr6zwMuKJ1p0/Z4VWOBcvuZSCE
	aukCvmDrUVBMXP+LSyl7Uqom62Qjg0Vwge1IZnQYeeLP21E2ZAJX4hJcM3gcsSSAQdJKwAqjell
	W8McFqd4wiymsqsRIU22tJ04VpNnKF2tE
X-Google-Smtp-Source: AGHT+IGSQHONXHhGs7cWOB0/NTlFhiN2ogHvgUjj0VhDky9sGi/Ee+gtbAm+6l/Fi03lgPKfdTnIGA==
X-Received: by 2002:a17:907:3e0e:b0:ae0:c7b4:b797 with SMTP id a640c23a62f3a-ae0c7b4b8e3mr100993766b.45.1750842936691;
        Wed, 25 Jun 2025 02:15:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:15:26 +0200
Subject: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=2007;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vCp//gPYQcR3DNj7zr7SuBIjoFrxsV54Ke1YSaCx7AM=;
 b=f5gSZiEPc0KYORoD9MIxojR436BImQVvwqEP0M+uXcgT4W6dNEvF51An0CzYkuee1ijtEq4Co
 CF7+pN7zZ/aA3gtmkblm7pFHD1iPm+Aw0sp4Z5flwM76VydGzDVk5Ke
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
WPSS.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
 	.ssctl_id = 0x22,
 };
 
+static const struct adsp_data sm7635_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
 static const struct adsp_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1478,6 +1498,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
+	{ .compatible = "qcom,sm7635-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm7635-cdsp-pas", .data = &sm7635_cdsp_resource},
+	{ .compatible = "qcom,sm7635-mpss-pas", .data = &sm8450_mpss_resource},
+	{ .compatible = "qcom,sm7635-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},

-- 
2.50.0

