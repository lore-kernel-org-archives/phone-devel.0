Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC92241663
	for <phone-devel@vger.kernel.org>; Fri,  1 Aug 2025 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754055673; cv=none; b=TY9Z9G5bYma774yQRMM18XD/k46/BA9X7h1oTeDMj2SWskJsdku2eWPLJK/fdm9V42nELQ2rQSNNvUmb4lhyY+TRMDPfhTIE8PGIzIsU3TvQDr5ufmIhCc+vmNjl+h3QoVRaJUciSNSCrlEgD+yHKWPLoEFdR99SCTIBq+aAWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754055673; c=relaxed/simple;
	bh=r1c9l1OijXU/QDDLBcy3ZcjwcgLrgltP3dZGJovejCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oSyBNSyHs/AUWsKmGjf3mIpkPeBba2am/QEKPNOfS7cLjz+VapjhRlIMUbJtXyPvadVInt/BeaFdIwTNcjUr4Tc45hF4eqvO3P6mBM3swQ1Ei6czi2g2ijGJqp/Gortcp57kRBjlKavKNOsN1ftNeHjeEe8ONz/OnSPCz8RKV98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=c1QhIUfE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="c1QhIUfE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so375306266b.3
        for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754055668; x=1754660468; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fco+a29BOB9mtDgoYWIpNOSq5S/ZGt3leEcvdoqeQzk=;
        b=c1QhIUfEhKHVK78f5nQ65L9bdCehwMZ8HpANGaiIOHFhfH+FnzYXydJOQ582aW4808
         fwk37JMyBD0J5wHdT0QrVNjnHwVTbfXyn0SGDMp5tCQSo96SkmsebKC36DfYVIn4KQPO
         FIo2k3ebwEu9RFU23L1qePLbbCemm0FiLS2an5eCqZgQn8A0Z9nb9t3lVOSv2BQcwH0j
         JmKULiwRKDbjPHYb0XtFtW7st4mRzPAt+QCf/2oeONytaWYv3xwd/E9BXvMxKARVPdR5
         U87ftPBiuUTVajJrbys9sb7iwohFsPGbmqwXHOSjFBMEnGU9guR8nXMi1K64mHMViJc/
         yNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754055668; x=1754660468;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fco+a29BOB9mtDgoYWIpNOSq5S/ZGt3leEcvdoqeQzk=;
        b=XwUe/BgZO+hQw1YTTNbvoTdu9NdW4WBpTFkACM9Ox/v5N0J5PNiruhDvFp2dUL2t4j
         OEY2Xg76ujOWZjc9vrlnojpfwPXlKmL3D9HMwMGj2EKHrv1GQ9MCBJEeMZHRBZpa2O+3
         EF74X4nmAw5VSlR6eKY57c28T5VBOIRuXlqYiJ1W5THWHCkHkOUs7upBw938jmCWCumQ
         /lJdP/Izgqczioz8GI5aKjZWhX61d3fByhW26+Qj5wqLqgBIdEX8SSOaxRa+UO/ni0Be
         JYhLTh2WQp4ygGA017YQMgPrtS+s9rgsW/KUBkpmaU3N1njNoUFTO7HY2UkC5urumVoS
         vwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEGmCdGWvujsbytFlhQ2TWiTL4XIK23vCdhbZ+tLAKBR00bkUnbErxUAQpVA/3CGY5mNPkTiS7b+iiJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFE5wMfL95QnaHkF34VERNxUoht5pYOurfzKTIhKBC3823UQP7
	YY/X+I0AF623HVGm1PhjPZg64FEqJgL418PHblTUGSNQO7WiU7+lhtmF0gjze1BPhQU=
X-Gm-Gg: ASbGncuOP6OQ1h81lJTEyfew11i//Lyq+DHSdLE3qELxfVx/9QHqZ93IWskLrhSzyg0
	7THOtdk/1XObHuJ2dnC7UAeH2CSTdwx0e4X9Rx6+3HBhe1XzVv5qUV5aC6amh/3u253EO1mFduh
	o5FkekHmL2Xo+t75M4oZkoZe7hZKrBOQwgGhbj1qX8lS3GQZ/d/B0dAJQ+VXoh667nhWtAjGONy
	XaKTv60guTL9iSfTgQi5rC0QmrjvLZZb4IksPEvh2QJg9rNqZJXvIka3JB4lELSfTDC/eUfNdiV
	/y0DQPnuksPGk7XU07cBsVVTiFzKJB5GqKxc8m0xWFlLmKbSnUvnfZWfCpuzjXOWGhnMufRSAKc
	PwVinbD6nLs1YtULWzJDopMC/+WpTiG9PmV2cUBG20mXC9FJ5QORjgsG/dgC/ZmUEU64euKDyC7
	jZKUM=
X-Google-Smtp-Source: AGHT+IFj00+KEhfyTUdUoeMsQOAVFICxssAUXXiQsbArF6rrRmD2nbeXGkEAgVBJGf4w+/U9QBdSNw==
X-Received: by 2002:a17:907:3e1a:b0:af9:3d0a:f393 with SMTP id a640c23a62f3a-af93d0b0315mr71429966b.25.1754055668022;
        Fri, 01 Aug 2025 06:41:08 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm288082566b.59.2025.08.01.06.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:41:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 Aug 2025 15:40:59 +0200
Subject: [PATCH] arm64: dts: qcom: sm6350: Add rpmh-stats node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-sm6350-rpmh-stats-v1-1-f1fb649d1095@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAOrDjGgC/x3MTQqAIBBA4avErBtQy9CuEi0kp5pFPzgSQXT3p
 OW3eO8BocQk0FcPJLpY+NgLdF3BtIZ9IeRYDEYZq5zSKFvXWIXp3FaUHLKgddF7FyYXYwulOxP
 NfP/PYXzfD+cRroFjAAAA
X-Change-ID: 20250801-sm6350-rpmh-stats-58d998ac8dd4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754055667; l=1009;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=r1c9l1OijXU/QDDLBcy3ZcjwcgLrgltP3dZGJovejCY=;
 b=tAHAiNynxK3Ng3bMtjfpSPW5u2gDSl91hy5GdfnCwmCR4BXuMzsfpHCbjiNS09KU/gl/wt4/n
 d28cvt0FPR4C+Fyc/3S93nOYzig+JU97Q7B7lehVkdaDfAvXkp1NaoZ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The qcom_stats driver allows querying sleep stats from various
remoteprocs. Add a node to enable it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 2d891a5640dead6b60386006bcbbb9aad40a660b..2493b9611dcb675f4c33794ecc0ee9e8823e24d4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2487,6 +2487,11 @@ aoss_qmp: power-management@c300000 {
 			#clock-cells = <0>;
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x1100>,

---
base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
change-id: 20250801-sm6350-rpmh-stats-58d998ac8dd4

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

