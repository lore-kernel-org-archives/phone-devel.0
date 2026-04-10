Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ACF3A16B0
	for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 07:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806301; cv=none; b=g2nAUaBBjs9qDvb8udDovLCLDPuH58r4TrFiStQPvwdC5gC3bIBf9vMPv7LSE+Q6mn9zuPStdhMrffHj130RMnjPloqUzTFYutSOLX+C5OJmivhv8yGTGBUVEnajNtaq9P3TC7vn3WC0D/bmY14bo3Xx2/kAcSyg2brrNEaJsIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806301; c=relaxed/simple;
	bh=Yuyp8/DcNzTxLCLZ/KgPEbXxPMI+WxTMHBAv85H+9yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ob3wky4mvNtHJ1vtmw754diF1Dzhjbcc8dfSvwa6iCrNQh6pVnO4nTtNjN5uWGsqouBRHtas/A2I7a1tWDjcWGDOQR4sIND9Gum+Sc9UUPC2r9HZzVSkDNOFIfGI/OY1lqyweW6CFTyU1DMPBWjG8d9QR7QxC6s6a9D0Fp7ls1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DauG6lXE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DauG6lXE"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67011a751d2so142851a12.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Apr 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806296; x=1776411096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3/xbbG4SZjH2WvQ1mzO3ILWOaX1Zj4QauzsBGBMWwM=;
        b=DauG6lXEd1dnITlocJJMBxJDrD/FvfCCloYH/BYjkueBTcEfCfcfgKq3fkay3DXj39
         OAgq/faN7MBCZez3nuruR8/Eqi1ze65Gi3W3xE1a2eZpUy5iJpty+8Lbb2UjOKHqeE8q
         pIZJOGM6pQkYgj/fk5VU6lVf+atjqpRMv5R73sxpA4sUBQf/u12YXnDJIGc4oYyDT5T2
         uTt2kAjhGlUU0aqMu2tzorttY6d6en7+N2AHsNedAGAq8mImkBX2Q7gi8vOr9NMwKoKl
         blf6geIurHKK89irbHuF+W9IBR7NkzUkfYwBCzE44RQapIcM02TsN147WUu0PrPKjpVZ
         dlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806296; x=1776411096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3/xbbG4SZjH2WvQ1mzO3ILWOaX1Zj4QauzsBGBMWwM=;
        b=TG39/gJhDFpnh/1vom4qNtjYpPk/Yq94Yj9xjJQVySV+noEFgOE/bfL59c88kqVgJ+
         dMoHG3ijCMfnAkXq0a+urIHwMb6eAY+Gm+wOOLsFe0bpYhblHrJhWo6YWGTdOTpDs8+P
         3c9tCFFzXnyBlAA5R34SBf2qpedVmMrRKRnKWuCf2xRTrKT9s9pz6qB1ltnhtK72icfT
         3od8huEB/dBtev+q/x1tVEQdjk10ESs2xa37nUmlccVt5uQeJs0Z717USsV9IKLRrbUL
         sCJ9OiFac3MxkBzAba0lMe6XqTuBBabgWQ/vQsSPA/6xwIP+85V/8zW0ZpMvpiquz3Tf
         8z0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+JwKwwwIhMutvjwa5vgOVFQYmDqrZpyJQFqXRGaXRtTN4kCnHTN9l6xIuRtQvlWT4qOHSC+e1jKYACw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuY6fv7Yx7PvJE5+iPKvAq744sB465xnCmN7Eawaf5ly1aUi2X
	VaTAn5+5xotbINggPFSvuycgupRxPnIKmjfrGVcnJyucGn7yTdn844n6GOTKoge6RFA=
X-Gm-Gg: AeBDievRcJ6vyc6IIEaVae0gfEO8BsZ5UTkPvVs9rKDAt/StrkIX52dtKlmyKdTOTOx
	ieGpFxSp997kqFmex5I20HgO2DpeTdJFGUlPRh2u1yWZ0rgiP/SMf+qE/TIkm12OTS9zs6kmnCo
	Muv0gYo0JfA2H/cFDioH/3qmhiTyPe7EMxeWhY1/Es93hAChHJIoXExGzp3wgC5htb6UnAFHFYh
	oaiX4y2vvVd+OboVBU1ygvcvyO0NdB8svy6EajIdCJ1nnzUF6fRV5Oh4YEU2c1Mfg1veBC51zvL
	+hBuY85Rvc2lLj8Sm8C/HPm6CJn0vJ+t6lv80VRflFsJJalbjoLYiBXxBhCNW4TaHZEBaYI9Pc5
	MoFFT/BBlmqwMPQQM4j9u/T9nl5DVesXrxHFs2dZ/ww1P5NhmMTsxlGY0TeZCdZqLrljAr9duke
	TNRiN38SD2KfuApCBPg76C6CrajIg2fnar5PNXSgujJyt2Irq0GHHxw1LHZfcXVOGLNP81gxnSX
	Ugcew==
X-Received: by 2002:a05:6402:4250:10b0:66f:8fbd:cc45 with SMTP id 4fb4d7f45d1cf-6707aa3f0b3mr689165a12.22.1775806295719;
        Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Apr 2026 09:31:07 +0200
Subject: [PATCH v3 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
In-Reply-To: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=1142;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Yuyp8/DcNzTxLCLZ/KgPEbXxPMI+WxTMHBAv85H+9yQ=;
 b=anuJUyoSQASzl44t4/DE5U2gzQoc25PFfbPsVXMRc+IlvfGKqC2m2B55S5K15oo0ecofEkH9d
 KIKIZ/5DRMxDjafRrzNqw7pqGNE/AZ2IAA7sKYFJpnBZ0jOMN68GS5q
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..a8536a873c69 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,26 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0x0 0x0 0x14680000 0x2c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modem-tables-sram@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0

