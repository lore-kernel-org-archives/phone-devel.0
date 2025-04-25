Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB0230BC4
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 07:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564939; cv=none; b=ry9sVKM5xa3Dwa/ssRJhuhAjt7NHxzDWBeVvOQddxc79SJgibENSgD9xFsFCkYwVWi0fbKkVierJoQYR5sqVtll8cjcXALkCTa8wxYmK8O9vPItUF42YdW9r85d6E+a5XHdSr/zDkub6qPEhnvCWv2+9v5Mq6BLN8i7bsYWubnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564939; c=relaxed/simple;
	bh=LA7q9pHIp9WcS0ADH7ddcSsLNvm3BotUh4LJ/goiaag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwHrvNwnLxFoi0jy/ezdlmZ6Fpo/g1w/9FEclzrnGhqveRPZcSE5e6cB4R0i4O/HDoS4nZbUCYfPKpNrsUvBOmbN0xbAJr/5P74w2HEfgCR4Mvbz+JZwENNt1JY0Iwy2EQTs5YaeB4eJiRtmV9Vze0lcobXRhUOtdCAKd5U/U1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=XCoVsl5Z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="XCoVsl5Z"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so17435555e9.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564935; x=1746169735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mm0mORpqXwGhjKCx6UTWDuYwmgBU3yr6fMoZERP6FVU=;
        b=XCoVsl5ZxXwuomrxsqaEHsivgCge0RZPjrPu23jrVlGpFiC/k86I+zPjAHowiux/5L
         5QvX4wtz/hrjEY4FSXtIftAWc6lmn3FVySpCHbeHMnSX723/np7uYB1Ymdk7pPGImEf6
         hIuRh7g0iUXvvn7rn5iKawAOGQsVQukJYDnp5qr3eqvoXaW7faDlKNMla+PT9mbvu3ln
         G7LxInQQnBN/5+zAQDz3j+JYY9P55SZQyv+48ctbym9iH7XhAb8n5OnakM6DRCYGUOS0
         WP+j6fHLhZXb6qOK/XvpFg26VAtoiq8tKy2RZgxee7NQxJeFCfqLkOVzbN7N7DNQWReI
         /TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564935; x=1746169735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mm0mORpqXwGhjKCx6UTWDuYwmgBU3yr6fMoZERP6FVU=;
        b=MKEjNjb7fVj+dWL0Zr8k8nv9WtpREmO1oiePVRMNnSEjTL/6X0/jzAbut8LMmhW5KO
         wldodDAgWG5MYUWZasdHnQdO41biibE244D2YtxOETN8OjR9XypMkVyYf5aZwXGiQsQf
         NNC7g19wvuun9l3Lf8AUN2UkN95vB3Y43Qgba89rjcHsV71B8Rpvc0wzFt9lXPxo9KRp
         u2fii+mDYeq7zS5T3JvpQZNd+o/tMviIecBmFNApS7qNs+zQiwb8KdKefn/aRsomQKTZ
         aO88YA/jf1MUDONe89p/MvhfV5mowb0CQLfF/oVjg+mmatFz/5KyjoVjN6g8d4pVAMrm
         eaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3VKm8ZBRMWtGDsZCJudiPjDQhNi7a/B7VhTzb6HeJq+2N4wn0iaicqBfE9nWrv67pOFwgx1M4RqjsqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBv4lDGGyIx4kJOY7EmZ1uLjxnqSLQxz5+9ZpnPZVzXX1fbWgO
	N5vTBKMs6GXol6NGfp2spIocKyNgHjTDCS+ju0NymTnR+dBjrKO4ZVmpNXJJZGQ=
X-Gm-Gg: ASbGncuK5IQxN0DxbUPrabkpI5QAGVMYbkJS8IvZ90qQo0A1GJnqJc2WFCwUPQpEJRC
	Cn3mc8GJijebyIbcVc8W8+ULej234/bMCu1RIJFi04SnkadNGGsIZL35//NQaWL/lRmmH62PnAX
	pnV3NKn4YrOJuLON9cfH3/a/V9APpcWJCgVbWFVWenuFta81t5nIhzAQNZax9agtCgu0LY+Pdp+
	ufy9yP8fPHBl3ucCNBajRUmqXb+coLo/bEzfmTxNEjwNkpCO4Az+RNsHfA7wimiY1UhQboCAOH8
	aL5iE7dP16zsP7HbhuHbk9+uOQqHU/71YbRmrtR/nj1j00n+ORorc+w/9a6a+M5qEE12xWmqvRl
	vikpb6d7ki5FysGo0gzC/VcPXr0RZ29TIpUxOMRGXVcLgS2HLPeMZyeaU
X-Google-Smtp-Source: AGHT+IGLT5RMGJOi31Z4EljlBM6Dn6ye/misUQytVMeOZB5sQxwZhioVj8uoLgVjDj0pdiM3s3HzmQ==
X-Received: by 2002:a05:600c:4ec6:b0:440:66a4:8d1a with SMTP id 5b1f17b1804b1-440a65ba116mr6484755e9.7.1745564935206;
        Fri, 25 Apr 2025 00:08:55 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:14 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 OCP96011 audio switch
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-3-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for the OCP96011 on the board which is used to handle USB-C
analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index ea9f5517e8a083e37c4b7432322bd6d18fea84a5..e0470be9142caa4bac4285a191725bbd60e706fa 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -750,7 +750,19 @@ vreg_l7p: ldo7 {
 	};
 
 	/* Pixelworks @ 26 */
-	/* FSA4480 USB audio switch @ 42 */
+
+	typec-mux@42 {
+		compatible = "ocs,ocp96011", "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+	};
+
 	/* AW86927FCR haptics @ 5a */
 };
 

-- 
2.49.0

