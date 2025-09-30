Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE12223DC6
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217856; cv=none; b=rOCCv5CvBX+2IV4g0HqYPaoSl5doDhWYzFxhyFsj8X1gSh86Z+hr/0EbQUITRZwXNhiBsZYz3Xvr0bg/eQZzocoVWVGUaEoHrfDMcfCyevFZpkaJL0snF6jzlYnOZf5e+R6SDYYnH6i+7v6XhBHksL1sI/EKbHFJv84QInydy8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217856; c=relaxed/simple;
	bh=ENGheAYnNW3g5COpjG03gMGNXlOZ2EcAFRzlHVSA5ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UORBTHRVRtaZB0lLCxx3Eg1+DIxFP5VxZKNl5l6R++VW6e07A0CobEPW1eJIcrOjTVg+5qllJowRt+LertMS1Jaa89Ba7L8mVVyOgpWAjtGOgN2OsK5DlCS9iPCPO+RXlZ97pj3gKZwY7wO+U2KGqAJLovVz4suhzXE8jv0kGE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SbtzrdM6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SbtzrdM6"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3b27b50090so497544866b.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 00:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759217852; x=1759822652; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1iApKO+F77Gmy+nvt9OQEdz8JuAQZPIJ8wB7y7Z7dgA=;
        b=SbtzrdM6fadj02L8XwAIEAp0QjVDZw8ef9lOJrgovoXOie9eIB8/j7TRtnhsDPkqZs
         pGrqUeY5dX8X2rf3edVDV5tR0k9hO0u+3wNmzF/Cm8xXvHECc5kCInRmuN6iy1NUswfy
         CpUrXNS4cYGsq8D/JBBbDKy8xZv3ujAdYoXSbvZxPeQTIOINyIQgvlrAqyTq0QE/3N3G
         qiI0RVmKrJgz0kafr1YVBF5CDYyyjTwWcZLCW12xELbbUDGTGskGa3Wy9poLCgmSj/FB
         h+kJtv3POt2SusRmn9qSZTDkcb2Ij8/Zw+DsRl3djiFaZ5W2wiaCEiimFkNVhZsdGOeu
         owYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217852; x=1759822652;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iApKO+F77Gmy+nvt9OQEdz8JuAQZPIJ8wB7y7Z7dgA=;
        b=qfeTUcfSCcpFdEabSQ6mfs9eAYAMJPIp7HdfoXq0UfrdMRihcHdb8LjnPEkyk27NLL
         tvmuX3vdv7HeCi+AtPdOYpYGPQ3YDKN8eMlJo+XYlMtCFoc0VvvN0skAx5TCzms/xX1P
         wZiam98o75gDvDlUX50L+cgzDK6xnWk1jhebTLVG2b5k8ryepv1Iqhq4mvIlhymAOh/8
         tdvzAQcMjDV6Mov2eozvliahBSBpYoW2r2Oy59pmfNPJmxQz1/F7wh6u7euZJ15d0BPI
         G7dUXNnPcf9SJWi5ob/rmLbTbyPH04z8UY1CktQgqls+cioLV6FvsoiIfAcO4BC4zTag
         oiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtCfND+02FlDnoMZhu16lp+JbMHsUiA9/8YbuMqckwDlqDxQZp1kLyzr/bE/fnGzccrwP6PxMlFUeXuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO8oS67Wx00WYSCjcyo1h+T3TIppaF8hH9Fc4rSvMbCKVu9el/
	BTyHiFyAG/pAaeu21lXoSOePkNpCIpW2UhvGfqbB2EwBeX5p1D0xxPFp/ScNzWQZxPM=
X-Gm-Gg: ASbGncscIcRXYr2IXsbQ+siREu0NJGVpG59ZPGWuYTbUczhSxpsO62dkYBAToIBExG5
	T4os5hw/znG5Pt7bVlZ5/vUrKWUkmZqoVUPxzvdEnaaEdOCi/CqvY2D2GMwjFOSAHGQ0qgCWWPL
	89tPrlKaSeGb0EQTpntDI/gEVvRj5hK7uQyCtHSj5duVZzxaOoyRVCCV/+/VVC6g3h061n/Mpr6
	hyohbDyq3l6ccYoXdXyqDTtDp81ovkCT7ko9+JzS2x91hvittkCpt0yEGFdR7vN3thiBRDTY+CH
	Pcy8cQXaSrPYMaIkm+O9u0RMfOxaEav8AnhtKXr2Y/YBDcOVqWdaS2xm181+gmEw1e0wW/Qkv1b
	Hn9k0Ytrq5aKdMbIj8yM6hl5klB920uTnaBoxi5asTAlGqkUuO7trweXHShkEy7XNxMNOZWbhuB
	KLTOHs9Yp3q8kjDwHCaw==
X-Google-Smtp-Source: AGHT+IG9j4qCfb+pWcKxOWPLNAWJqVlW5gBDMAQjRf28CzIk+BsQWovz6lYnrw00odazuAg1RoDJ+A==
X-Received: by 2002:a17:907:3c8c:b0:b09:c230:12dc with SMTP id a640c23a62f3a-b34b7209e46mr2054121866b.8.1759217851585;
        Tue, 30 Sep 2025 00:37:31 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm1084376866b.24.2025.09.30.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:37:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 09:37:22 +0200
Subject: [PATCH RFT] arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sm8250-mdss-reset-v1-1-a64522d91f12@fairphone.com>
X-B4-Tracking: v=1; b=H4sIALGI22gC/x2MSQqAMAwAvyI5G4gt4vIAHyDexIPYqDm40IgIx
 b9bvM0cZgIoe2GFOgng+RaVY4+SpQlM67gvjOKigyGTU2UJdSsj4eZU0bPyhZaKyXJlMkcWYnd
 6nuX5nz20TQfD+36Jp6K+aAAAAA==
X-Change-ID: 20250930-sm8250-mdss-reset-307c3e921d03
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759217851; l=1086;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ENGheAYnNW3g5COpjG03gMGNXlOZ2EcAFRzlHVSA5ng=;
 b=J1uq8r0DaAiTXMXmOmZSb+gbE0/AQqQXkde/No4Im5tvKyezccWDZwJHxiAQnh5r8fiI9uUYS
 R9BxHaVroVOCzWJst1RVXSv5OAglNbGU9CNARiExyL0gF6lWU3pNxXB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Like on other platforms, if the OS does not support recovering the state
left by the bootloader it needs access to MDSS_CORE, so that it can
clear the MDSS configuration. Add a reference to the relevant reset.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Not tested on a device, but should be necessary on v6.17 kernel.
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index b30aea8b05409094837ad494389d7c22fa1ba7dd..9bcb2c4c34388f343fb93083977b8d2e9a724bb3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4687,6 +4687,8 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x820 0x402>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			status = "disabled";
 
 			#address-cells = <2>;

---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250930-sm8250-mdss-reset-307c3e921d03

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

