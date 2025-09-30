Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880E2DA743
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759240642; cv=none; b=KeBa8eZx1zvlTt+PgPiv01U/zntS+JlvDZ77vkptwymlhhykCyYt6KlqwbBiC6VQL3Kjqwl2OYok6gIDDZGXxnaiaho62FOhqORe6+jyA7V/kPBByYclWdveqn2b3vrm8O/ioWWgOMrdWy20XZGPK681UM9PVt2YRo3I8cXmlvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759240642; c=relaxed/simple;
	bh=1x84MG3B6+rIyLmlzbvcHx7tOGONlCSyAvhMbbN0B1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCwdbkoBuFXHw4y8iPRDjeDCNxuDs5ugOeW7GlPrlP096AQke44y6VBnTS5ysxcmvkBTKLqleYx7hQD93rNriRO55BFtuV1gielmFP8hgVKI27qGUdw+mxwPSYMiEoTcWwXOA9GY/VGNulBI2z+VSxlvd0zAE0mN2cFzdBQqIqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KO4st/kh; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KO4st/kh"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3e25a4bfd5so472274066b.2
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759240638; x=1759845438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xA4DauDgUbKo1WZQ953ToPUo77YTzWkhKxmPQMFvMQ=;
        b=KO4st/khWCNGzcSTDyQTFXvDYGQqP4S9fy7EoRTzrbUFs2wX1rxRGMDN2bTGQoXokW
         IKYZlYT78q9zUnteoMyk02boAonbSZoXhTo8b3zjBxH4AoBZBHkediqvV03X0a4G+jT9
         VA2cPqxy/ENKm4E1pygY88hqQ1JkG+p0MoYrMYjUFR3okQluhDXY3XCtSFzGPeEv1p/t
         WpH3K9ISTfK6ACJQrKcF/tPkJLCH2//W57MauxlaGW3+cHbYDLb3k/JieoCrRwiaUraP
         /6THhp4rsj9S/Jfof5GSIouL495OO9zYQMAZYFWZgO7VxOJ+CHCLpWa7HMEXPUcML/xt
         egaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759240638; x=1759845438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xA4DauDgUbKo1WZQ953ToPUo77YTzWkhKxmPQMFvMQ=;
        b=kJ8o1O7NdCi+ux3hsDt/wlEbVqQ9kLlj/bVzLbj7baBzbjbPhzX+9FwJ/qL6UCg6Qt
         k2WQSPCsz5TtrzG0xY3EMwOI9kCpItoiQ9+xLchtDTAafTx6AJm6b6/cdhgdpSmajo94
         JTGdvFBIvjN7kFlNvzDj4lkrxzmuYqC2lD7/CqICcs37QvUDChuXMpAdYQ2bpxrJZkvi
         TyJfQcqBIw7xYfxJMGjPULbpdr49zigu6o+S9ocaWcXCesCvVkGQQWoQJViRT9/bSzom
         akfx52QUN0lYAwdCwLrV7bX8Vk6xfnpon4xo9jaLSZBwSt2CN1vPCVOdCb9cwW296nOb
         yXKA==
X-Forwarded-Encrypted: i=1; AJvYcCV7vxXThBiZrSQ/pM5IoiHT9vvhYwaU/w7WNsUtZj5sPiGwERWCsmTDKnKWNqeut1UJwyCuQjZSwm58PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGgc/g+wTzlNOn7DkQE0mJ5UC0Qo4TpvJpnUJvGFFNWH9B1cb7
	DUcL7u7Y/U8x3erbgrCncYgVLnLEOKIoKWKs6h1ljMc/8rMkPfy3Kf9LjxUyLErNyeg=
X-Gm-Gg: ASbGncutnU2SiJyZ1EG8yH8gk3BETsrPaBsbv+wHg/D1/Qd8yGhDY+59899PNQUQduP
	WZM9g0TqzIWSVdxcFGc2Yt7oDWd/B7p/ubBFdY0ZwyIJT5eLLJvFPPBDQWsdbCQrnKfra9X1fqB
	tWTdf+QriUDAVcZqRExZpRo6D83N4/0PTdFtKk1XvoJhoQtcpZWull8fMXe4Lb8rM/D2qjP7Wt+
	l2mQF1e2+czxBkLgJ5QSAnrHIsDChbXElJFJJEtUAYBtbVwJe+hOf+BkUCKr3H6RME7R73OVoa8
	tUKnlYUVtXUvEcYPwZHV2DLhJeF9OpV5sHtL+6WVbUGVmHXSxnl578sv5mIpPKIOpU4ASWz5brO
	cZiiYqHXDkvPPtNSxYJp86dLrHGH5+WNV8Vy+twt4MD7j8f2kxXLvArNVEJsSBzWYkoOWbdch4R
	BR4+izO/TOLbandV581A==
X-Google-Smtp-Source: AGHT+IERKslKjdq0BrQ1VOkSh4EKFusUKWtXRtHjmXAW75SqlWpqvYfjUSZtYoVl8r+DZg4tRIiZLQ==
X-Received: by 2002:a17:906:391:b0:b3e:151b:849e with SMTP id a640c23a62f3a-b3e151b86d4mr767458966b.10.1759240637785;
        Tue, 30 Sep 2025 06:57:17 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3fb818fb90sm370234866b.63.2025.09.30.06.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:57:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 15:57:02 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
In-Reply-To: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759240635; l=1168;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1x84MG3B6+rIyLmlzbvcHx7tOGONlCSyAvhMbbN0B1w=;
 b=lREdBSoS00W8KHeYcIcLaMeAqfjHbVEtn2/Jd1CozYTiGlPwi9VXXkojQmraOODDAdyTDjxU8
 vLr9Etgr9MyCANvti2k7FWCn7e+pmM83++TnTyiW7tbMIOqoktosrWv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Describe yet another regulator-fixed on this board, powering the ToF
sensor.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7329335704eee567761 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
 		pinctrl-names = "default";
 	};
 
+	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VTOF_LDO_2P8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-enable-ramp-delay = <233>;
+
+		gpio = <&tlmm 141 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+	};
+
 	reserved-memory {
 		cont_splash_mem: cont-splash@e1000000 {
 			reg = <0x0 0xe1000000 0x0 0x2300000>;

-- 
2.51.0

