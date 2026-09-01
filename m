Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E7476694
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253579; cv=none; b=UHvnIGD3HOsrU5C+EINvpVYfQeRJ70+7gS5yEaBgxX/yHPoGEBuX18qZ057tlk8UglPNiHO4bX/+XSr43rv5ZKeWYLnB0YF5KFBUySz9bNpehQebag4Mjv/+3zr03tMi8fUUxL4wrhe2DYm0NfDmzhfluIhPEajbtMW1G0cu5S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253579; c=relaxed/simple;
	bh=VLMCTblWAmcjvlydjiDQOaM9EY30ui47eVm7HFZNWD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HX8BBixq06kTQUuTXMlf++YtR4gCR6yH2BBWD/B6ID4ZkgnkixaZ9cNwRTSz+xBsV/LYBIqP56LsiQp2pvaZ/4u0Ob1oE0kpOfual0XhWKCydOkSo41LsqAtiV7QQD9d04iJABlskNUEJI+NNOin+t7T2hUKAn4k6QO2k/CTnRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zwdczwa3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zwdczwa3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20ce3c118aso161509566b.0
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253575; x=1788858375; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4RZfyoM5tD0q7WqcULgsURT8LaR6zOJsyJgPkVRkoT8=;
        b=zwdczwa3iQSrZKHoSS7DDDQ7f3Stbep0b0Wfmlg1EcCRX6SxYF/9MoNo2WEoq/01zy
         /PXQNiP2zkkWrAiEovCOABUVNTGVStO7sYtNrDIyWSa4R4UdMvM+0g6LCnriq1vW6PeB
         NUGGb4hwo72xPuhxuZ66Ni3bPLOeERjb8E9WCr1NBSl/x6a6LF0RR+huuBDHTOiDIDeN
         +kyHp8LgENnkYZkCXv7OxWlF1z7gzHmPkSYLajmA7T4dI+OMsMdguff9bvHItgxUwjiz
         5EeBUrRo/EiIvw2yTfB/mo0c5WoB1EBNk3zes/W9Rma5KmPZxvbkfuE2IN/bMN7VA1Qj
         4/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253575; x=1788858375;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4RZfyoM5tD0q7WqcULgsURT8LaR6zOJsyJgPkVRkoT8=;
        b=iJtfmdaeGOF804LcY2fMjOvbPE+xlZQmrHEwkLuIjJJt5jhVtd3BzpuG2H+2SPFKaM
         b9qPKkENMy4lURqzcv3OLsvkeMOgrpJ2hHpTQ1NzbcoG9n07Wp2LDEAsaCoJbUEphyaq
         0YvdBFHwyijthiMtHAJvLcriZCgsdKnwNBg4XROraXdmXBHcnZ544zofQNkrjCPFmAiQ
         cfj7xtOJJoes5JrYTbhWFc2eVlCUr2F90TrrtKMDZWuttStptIlOonRWTE0zvs3DBvJq
         x4Zu1RKmHb1My8wO2aJdzILtBJwbZolnudJpd6CVSMuvjxNqJQ3N2xFLpYMdd5XPcR5E
         Y4wQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsqoT82h6pRkzC5QdO8fUjeQbD3SWt/ghGna8Ejh538ZNZTOoPJWn6nYaal/4yDOWfQ8hfL5rjxEyWXA==@vger.kernel.org
X-Gm-Message-State: AFuF++mqboCK8ZINy0FiPORRsEODLIX3vXCgt7HnByy6UUoNIVgIShcV
	dpeP6dUem0JFoXtQ/SSCS5r7/TFQMATXkTRaRi/MMrHQSEiqoKXmGqt4MPqHXcSZeL4=
X-Gm-Gg: AR+sD10qg88lUUETmaJ6s3pHKlp1VX3VvyUHm+/E43YP/aKZvgrRNXtSVOahbQC8f/A
	e6vefmU7glU3o5TGJBKAV2+WshKtogSfrjat34iGgaqnBmblXfwbc+rYnmm0gJ47IeN2hqPGkab
	Eh1FyNg1i5P2vR2wF84RmccEDrk3QWa0swIIs0uQojgCXQ88XTfoyETuazcjff0DVsqAD7oIAkG
	zG7mF+384251HyqZYT8QP96iVqNeSa0JQMx/7nnxXHwnOpqu9PvJPoeNP08wA+4ky5MCeFJcTSE
	aPbN6ALpxC9WsT3Jhkn9X/I+Otm0AMUNUcG/s+g3YNWbL1OXn9ayTsTTpJIai+XhXsSR0+uBRvN
	u/vmrOtwuCwHlqjWjSTVRy6nxNlor2cFVPt3hl6X76h7GD1yhEQrqOgO6s57nJefE4C5GxuRc0C
	OTQf0KLhsURRP2wl6+/3yoEmzoDy3UM2Eo62QDQ14y7XD7U7c5ZvEgewd7wJ5yp4dfEeEePXspn
	MFVFjQ+vLuqrSWeeVNncrqJomfMR7BZEBbJFTqT2MA=
X-Received: by 2002:a17:907:80a:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c25b917f381mr253265866b.6.1788253574737;
        Tue, 01 Sep 2026 02:06:14 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee7335asm525484866b.27.2026.09.01.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:06:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 11:06:13 +0200
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2Ixkj1KuKixpl2FGNIrAji3
 U3b5Vv8f0KkIBShzU4ItEuU1SUUeQb2/XQvQhmToVRlrRpVIPsK/TI/tFHoV4fGjGybWjMPBlL
 lA7Ecv2PX/x0/w0R2+27gum5fOokCcwAAAA==
X-Change-ID: 20260901-fp4-pmk8350-pon-55dfc963ffb5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253574; l=982;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VLMCTblWAmcjvlydjiDQOaM9EY30ui47eVm7HFZNWD0=;
 b=OLfQFq5Si7pDMICrd4APmwBWRMw+HenJSjX4WknR1Em3H7jb/DuDAJluqkvwR6PHLVY2xqAh3
 MwA6BCej4YeCiTxRg8BftPuiK9yE6nY0uI3LT7wbnq1CtTKNsD0eubw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
one should be enabled at one time, so disable PMK8350 PON and keep the
PM6350 PON.

Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 5d20ad93b0c5..773304b4759e 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -992,6 +992,10 @@ xo-therm@0 {
 	};
 };
 
+&pmk8350_pon {
+	status = "disabled";
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp4-pmk8350-pon-55dfc963ffb5

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

