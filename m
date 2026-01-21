Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED2048C8C1
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001998; cv=none; b=e3Lo7UwNbnnPGdGtfe1WXDUdZP8S9HbsP5mUFDpIlV0drHhxjVlK/KyauTBMRutXyHrkAmwS2xzv+1r1qZ1Fppt9/LSJFE+1a83ueLz3wkEyXphCmfsCd09qQ25bx6r4F6vIrfCFXR2SBD2qzvQsu7T53a9IU9/Tr+aA0Uy6C3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001998; c=relaxed/simple;
	bh=59zkknkV+4u3lCcwhYSFnDAH6nnfGIvbUcRT8uB4bM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IV43A4Dz7m7uJiAgLacSXWckjOEsJ25er0/JZw850DzUPDhkAdvuO9EYaELLxZzXfQjhPOdiUW9QWgVuf4TdG3DkvbLDiGGtebrN9qXPbEgQVyZECLfASXGy1gkPQI/ZI+qQeuqAHL5pZ/H8IdhtWeShrRaitIBLo+2V5LLa4Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRFO2umK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRFO2umK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso3487055a12.3
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769001996; x=1769606796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYLY1bnmT/UELNGJiy6K4e9PC0QLu4h8bdmEIDbDCz4=;
        b=aRFO2umKYAO7YAIG2X1xHw3gQ5gQeSg/lAwbkSUOEw1e1li+7CWo2lcUWYCp1MnR0H
         reku2V+ISmLei5LIclnUNZ+VDSJ7NbtoWy6dzEZyLnSKqNZRH4DnogmZw+Czgx6eUKuV
         Zr+ov+VIG4mguP6mC0p2GpiyR8vGaiuQCaAekMcyl4F4sLRoJzbrCtN5+UwSMrwBuoC6
         RLISZmeNzN7sznYV3NhPF/z2OCccnvwpfGl0+PvWemeoAhswuvmcRqmsMs2IkWlWtsTX
         CpbgUp6yIo/QpyQC2nJmbExieKcTVJ45EGVdZtNpufFUOzlIZSC3kZxXnggVz5XHsOGx
         FCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001996; x=1769606796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYLY1bnmT/UELNGJiy6K4e9PC0QLu4h8bdmEIDbDCz4=;
        b=Vvvb42DqEfNFsb5ULLJOBqTz5yuMcEGo7FOCGwgpMPtV9iU+o5RO1X/ZG46McUvQ+v
         UOQ59+wcjS3mvymsPa7+41u7FKaRwWpqdsJHY8eXgNzFgey39wf2wKm1KxxC7lQW6muW
         /r+SVOlnlG/ytlXzaAs3z9KOLlfv0UFCxY/ZnfFUEBFCKLLHUkcs5kxbpSJW0OYxh30C
         y3y2r8rkhCw/pWGuMVdmiWNwjloaviqOSbuxVWzMtNjBf6+8niEEp5XBGAvqxB6aX8Gi
         m8peA7+N+AlFbfcahJ5/I+VroL/y2JgjQDQnnRgZDqsqdGU0NNVFecrolNb/+XTbl9NE
         hHew==
X-Forwarded-Encrypted: i=1; AJvYcCW/EZRS9Sx5G5a+3+Xzq/1a2XOqiljKyxkyZh8xWflcJJe/RgVrRKa1TTiZbtznDi1x/S4i17ymFgNj7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdsi6ioCvZPa8GCEnnWxxRjPU3tU1KBhu2G6aLNPkyK8Hyz6T
	7s3fI6BhOFzofwoHAI+AFGOaUh/6/MG1Hcl0FinvihnvlsxOhl7ilfKD
X-Gm-Gg: AZuq6aIos8nA2QbdSTPEFxO/AHBj1afrlz9OnLIkxekpEcW7w0EIvJV4rodua0xTaKi
	hO/hDZ0IidAi0OIOiNK7qL9Yz1iQQPAHLUAze0z/vO2HfC6SveRp1bX4IDRC6ksVeq4orMZUPOI
	Xi9a56yFg3zQWV9J+T57LmtYwYYUcHmS/MwC3HimIdQHGv9Ik+K+pEXW/ZFowDP+QRYBgu/hmYI
	IjKV+92GseKko1s+7bSEvyz4o3scfoMgLeaNoSQfHAyIZmfXDYiDbVTJh1dRrxsArMS1ZBEtxTz
	rn0GLlSIkBm7w59+sQv7aEYVUT39dK3MDn/VwnwqBiKWKLpEqA1MzVZnugOLLIeBh5BS5VDnL7l
	24FYeOkq7Km0wjRTA6miCais9UFerzveai7/jleBxZy43oalk/uBLqgn9u6GxIcyPmToL4kn9vk
	dDC9hDBSiArhtIu2C6
X-Received: by 2002:a17:902:cf41:b0:2a2:b293:27d2 with SMTP id d9443c01a7336-2a76b1695f7mr49461905ad.53.1769001995875;
        Wed, 21 Jan 2026 05:26:35 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:35 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:18 +0000
Subject: [PATCH v2 2/5] arm64: dts: qcom: sm6125: Add PRNG node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-2-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=817;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=59zkknkV+4u3lCcwhYSFnDAH6nnfGIvbUcRT8uB4bM4=;
 b=m5f4PVPOPIMFak8j/1n29OrUeOp6fju09JAA6T+z2o0besh8gpvSgjm4E76pTNvlIesMflI1a
 fQmy/puj5kxAc2VmDnnOza3LAAvM2M6WDmX0/iARue4kw3D07Bhv7F5
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Add a node for the PRNG to enable hardware accelerated pseudo random
number generation.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 8f2d65543..e60d4d74c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -686,6 +686,13 @@ hsusb_phy1: phy@1613000 {
 			status = "disabled";
 		};
 
+		rng: rng@1b53000 {
+			compatible = "qcom,prng-ee";
+			reg = <0x01b53000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		spmi_bus: spmi@1c40000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x01c40000 0x1100>,

-- 
2.52.0

