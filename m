Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001E123505E
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144349; cv=none; b=A20PD9YPOuCxdL5gNuILEVEST983nOSpTAOXsuRI7fQ3zKF6NhBh+Aymv1jtGPFWcYeTRNIUh0LBQBMWmtLt98MHA8p1OfsZRFs9NTbbLllho0ZzdG9n3nfwwyw3ZGSn6o2Tlm3d5aaZ6ojJmhF+6qKrPm0b2mP4xwv5mXxIl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144349; c=relaxed/simple;
	bh=MOth1MOMNhgoxoy0OeQdW3iiGNtZ2M3uZvBjGjaYCzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f4zP7HIrGeCs5tEhkrkvERtWzN+PgGq4Lq4PGpjpabTIZaEyHMzSMyol/r408adqXVcrrxMDA4p3FMz8ix393VFmwNryrn6Dby1QMkywbvL53ODN+pdXFhakjgmhBgp2DXATxP+5vpDmq1mRR3p3AVEcqeVSGPaps3gvYHeJIc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Dt7ORziD; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Dt7ORziD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7a6e56193cso290235366b.3
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 03:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766144345; x=1766749145; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hso2zbgibZLxlFTB4p0W1IRiqs7QuHHIdO/CJaRrSU0=;
        b=Dt7ORziDRkwPL5FoGQXXuJFkmuOuOsrQb0572L5AjA6RAPrGxwDLnRUtZAHgiNws5N
         m+86FCx0+KuXeMzCGCzdu9J1i3L8AIsqSMRXAhlabCI4dPqTDv+VjdRlXWlaEiGAj2KG
         eYhNj1EW7DFoDo5Y4Pcp9wZPeDRBurI+uSyS1s6TUpQ6NRr/BZ9kjP48/Qk6sYabspoq
         cUH/pi7+48vhb1fDKx1AUfeLA9mq2MA23//LmVfo5OuVYVWpHywMjk0KVPRmpu0keMLT
         GylwYDcsha+FjQUraKbreRupSoVdcw1JRvkpHZZ1WPI05LBBplFUlZ5viVK/ki9Rmofl
         4RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144345; x=1766749145;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hso2zbgibZLxlFTB4p0W1IRiqs7QuHHIdO/CJaRrSU0=;
        b=IjvFlFf+7rFAJ+EJjdT/xzWv054f4OFTF+g4yOeFz5HdFoswUvlf0p26QuK9nT2VO2
         /cY4vQlafJmHkpc2sSz49SHkDanfpIlBLHEok4J3dY0+1d+CH611P7ZXg5FDYCHrZ++c
         EF93rGcCPLLL1cc9NSSjyRsD0LBg4bba0uIznvrwlDKi0yLM32kaFbR3KGwnn+7OFh9W
         PjJlqzf6LGzC6sciQJ6XqYC0ZoU97oDVHSR2bpxj81OtlFPv5/SnZLbAwtfD56CTrdsd
         rMe28nFpODaAgEs0/4lH6zYOiFnWkBLX/338zEhxFWqtVlLous/+fhFGLHI4B9dIhXk8
         eVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwKxOPVmhRqZ5odRYoz0aR/7oTTTht3wrEX8m4udrGIT2yqkJopDrQF4H8TYOzm0jzbEX/bCLYDdZiZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9Ml9vEs5PBwnp1VG82VtFFZldK8Kz1sNBcBoTBvJxPEN/+qo
	DjKft6nMw6vdNnFmH95Is5AWVGD/rCT0R2Z+68Vo5O4FRJbt36w0+nXTjBoF9bMPEqE=
X-Gm-Gg: AY/fxX4iObnS8GQIVSiw/6vBqxYvbUx0xc0UaUL5P+2aX7Gph6HEYaGymY30AZeBjPm
	kPRMws9WCcawqUkhGOuJVzaxiGzbF7V9Ct5AmZPC/RcrFbJ1ui1sGMkn54SDHGJBbnKDi3SX9Tk
	Kl5EUOeHUA49yFupTG5/FOyk5A5MRFUY1uti8gXZtdD8xSjj/EqD7k0VrvnDVqCkReTQtcKwgH+
	xcRgfT0546lMuPqDX428P4rPdpkTC5MhB2A5qa7kCTsbqAx80v8PAi4K4T08WAvvUzO3NRHhl69
	sOUqBHHVgIXlNfaPEvCQy24c6slXcjLqVyZ0ejQzrSYMJHDMaggb0aadDIO4eWEgOrESShnXBrB
	MiH7nJHi+5Lx5bJgEL3KSjILUzT0uyGusFsS0d8hVniBg25+cyqTSuGKjcuB/krwDxcvMIJms8R
	HEP+r0g9u6KJ1/4u5SpmOOyLeRPMrNlvCeFzUHxkFgAZu+HKgZJtalu4iZs983ttPaA0ZGI7cZ2
	Y6eKLNXe/SsrSxBkg6/Lv14NUVBXq0Yow8=
X-Google-Smtp-Source: AGHT+IGpjToIBJ44QoNH+SbgkbTJNPHhnqrJFPvM4cLmxG9MfJQgRo4eD050bfH/K4zXCtsLTbTckQ==
X-Received: by 2002:a17:907:7f07:b0:b73:870f:fa37 with SMTP id a640c23a62f3a-b8036f63811mr215818666b.17.1766144345215;
        Fri, 19 Dec 2025 03:39:05 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ddffc7sm212534366b.43.2025.12.19.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:39:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 12:39:03 +0100
Subject: [PATCH] arm64: defconfig: Enable options for Qualcomm Milos SoC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-defconfig-v1-1-f58012ac8ef6@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAFY5RWkC/x3MQQqAIBBA0avErBMcQ8iuEi1CRxsoDYUIxLsnL
 d/i/wqFMlOBZaiQ6eHCKXbgOIA99hhIsOsGJZVGhUZcfKYiHHmboucgjHYTKStxtgS9ujN5fv/
 jurX2AeQy/cRhAAAA
X-Change-ID: 20251219-milos-defconfig-95d3e2c018ce
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766144344; l=2186;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MOth1MOMNhgoxoy0OeQdW3iiGNtZ2M3uZvBjGjaYCzQ=;
 b=LxyNjGaTNVn4N1yVVkakEW2xFhItwfyvQBXfpC0vjOBiCFuBkE3HcXDaPBYumYat6qJbOTRCG
 IwS+mOC/m1hBmB2kNEqLavROX9oTR1nP7WNR1B897rxIAJjtJX8yxYk
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the pinctrl, clock and interconnect drivers for the Qualcomm
Milos SoC. This is required for booting The Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2f746f779323..4828b3b704d6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -671,6 +671,7 @@ CONFIG_PINCTRL_SM6115=y
 CONFIG_PINCTRL_SM6125=y
 CONFIG_PINCTRL_SM6350=y
 CONFIG_PINCTRL_SM6375=y
+CONFIG_PINCTRL_MILOS=y
 CONFIG_PINCTRL_SM8150=y
 CONFIG_PINCTRL_SM8250=y
 CONFIG_PINCTRL_SM8350=y
@@ -1494,18 +1495,21 @@ CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
 CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_6350=m
+CONFIG_SM_CAMCC_MILOS=m
 CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_CAMCC_8550=m
 CONFIG_SM_CAMCC_8650=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
 CONFIG_SM_DISPCC_6350=m
+CONFIG_SM_DISPCC_MILOS=m
 CONFIG_SM_DISPCC_8450=m
 CONFIG_SM_DISPCC_8550=m
 CONFIG_SM_DISPCC_8750=m
 CONFIG_SM_GCC_4450=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_6350=y
+CONFIG_SM_GCC_MILOS=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y
 CONFIG_SM_GCC_8550=y
@@ -1513,6 +1517,7 @@ CONFIG_SM_GCC_8650=y
 CONFIG_SM_GCC_8750=y
 CONFIG_SM_GPUCC_6115=m
 CONFIG_SM_GPUCC_6350=m
+CONFIG_SM_GPUCC_MILOS=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
 CONFIG_SM_GPUCC_8350=m
@@ -1524,6 +1529,7 @@ CONFIG_SM_TCSRCC_8650=y
 CONFIG_SM_TCSRCC_8750=m
 CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_6350=m
+CONFIG_SM_VIDEOCC_MILOS=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_SM_VIDEOCC_8550=m
 CONFIG_QCOM_HFPLL=y
@@ -1825,6 +1831,7 @@ CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SDX75=y
 CONFIG_INTERCONNECT_QCOM_SM6115=y
 CONFIG_INTERCONNECT_QCOM_SM6350=y
+CONFIG_INTERCONNECT_QCOM_MILOS=y
 CONFIG_INTERCONNECT_QCOM_SM8150=y
 CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=y

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-milos-defconfig-95d3e2c018ce

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

