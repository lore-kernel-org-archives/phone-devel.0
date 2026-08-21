Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83140F759
	for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296353; cv=none; b=S2b6jmNMbwFAmNcMeNws8tqPPcmW3DoSjAsTn3Rh0j9lkYv+N2sHfdhGGviT8ADcQXsodY+nshtlsX21mZcEwVzOwMuoLayTuQcr3BJu9rRujIrGUWM6F0oQ6Ya745xGI7ZJeAFkXlnqbq0DzS9ahCotRQiXKPPGNvsEFxYENAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296353; c=relaxed/simple;
	bh=Ce71U+Lyj7zFttVA4Kn65SW6c32KT53zyzKRPu/mOUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7T1MhPuC67c4esXC3tHS6DB/BG5PX+8Z0b4RPi2H0S29halCBHhvBnir0EnlMKjIFLKNOFx7BVWqBCtwBXrk+SJ02zoIQCqF0UBE13SNdf5/fb6dQvmWdIT8pMzNrCm3YKKIvpCBUnEFzq05urEcuB7iL+5ZfbOH7rlnXitHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZlrxrRH8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZlrxrRH8"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c160420289bso100499766b.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Aug 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296349; x=1787901149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09WuqDumRufpTv9AnStx+lDfstjiG5sO30YMgz+/VHI=;
        b=ZlrxrRH8PG+Mlvy+JTBJBJivgUoAFSsWHVsINndOu9KbgDMFIbvLP3cHnzX7sOrJLK
         pEd8ANlcwS8/IediH5tNt61QgzcHTHkNXDpfSOBxW05yy8AN2KQTFK5EZb0C60soGrhd
         cvwHbuHwB+y+QCw0Ips0UivRRe6Y1xAoHfqzCeFRtkE+Px2VNDPAsuw1jYDKx0gHZf3z
         MDgcQ55zyVt9yvntPqKsTtbkkN253+nx33B84UrXPq6TjtvmaRJHrIfmN0/f8YthDpFw
         GSpJCwUSrw2wnh+e/yAvLFlXzVfstlaOlVB0wTBODmYBbYh+2IRqIWOZALoyb7+5zdN1
         zPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296349; x=1787901149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09WuqDumRufpTv9AnStx+lDfstjiG5sO30YMgz+/VHI=;
        b=XWnqA2QM/FUH7v1Fqh78szGWTqmKayI2K30FVHeSsII/5n1gFL+vINXGRgvImJ5giu
         iC7Gw/Xp/trv/gvNTSWwLvkbzbu5PHqBKOHPOgxf6Kif7rUJF4J25am52E0+O23DEz+l
         XVqDIAlMRogVWRn2FgeWgzjXZnRh3sRB3mJD4p7k3bewGIbOXwX4G8CY+PDN4mp/fWvS
         D2QXMJqbvKo6b30PPqBMn9KoMHikJDmp1GwmhoNXzEs9oh0YJJh7HfwgtuxWb7hkvNt2
         J3W0yu14lC2diY3ITxf8j5cYcDJNLxnx3Jw0aDMc1A6DV7KBbQbdHjEtLAxjFXzOufas
         rr7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq6nUhA1zyDf6e+Yc/btc1LkvHa8aITGIyih8I1DIsNEkJFVot+ue3tEeYq3+UrpcD8rwtKh7aHH7BeuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lsiqMApLvLg+4WheFZPbdAXcc6PmRG2LUAb+PYDDo+lnWJz89J
	c23eEJdEbZ4dWXnS8TGMc7rtV0pZnWb4pjti1aCVFElhBKDT8dF1uLHtzpaAZ2DEYcI=
X-Gm-Gg: AR+sD13Tww8PSuLyBvGB5uohBJWR7vMUJW/KxuKbHTBlcPtP+ldqS5rP0gz60XvaerI
	MkaNwNF7IO4XMpG1Nv0BN3heKxVPtGw9g68jT63GJGheit9CBhKkIJgcv7q5l7aSPYtp/ly2FER
	6uZeQKM8l8tHMItAbg3L5r2bIah77cD32muBDO6oL6p2c4EfpHxdEFWXUWI72+PMokmKduA3Q+D
	/FpjSzXb4MQb2tgD65dQmkgHnQNc0Jasayg7pwrOlWfv2QpYXSHuAcSTbv5NyaIcZ5Iv54BZUzo
	BV+ToZ+TPzQJEQ0LSqyBj6yiGIyN2Bv4bxREWra/zo6Msbx07iOsqTKxc4aVxLQ10wQlbAdTaGt
	nr8NoQwFrua6XFR2sQTWiSb3hOX3vhaBmXYGsmaJkWdTU7iUJEnjXeB0HTjNyd1qofEoiwqip+Y
	oiBN3seGDPvEDyofM0fy4TiGLc+S6FAFyRDFegBliYMbzddiuUQogdFGCwSTPFpPYDeX3HK6y19
	KgeFTzYcO3gOyp6SQT2JfIeJPD4EvIlfjJeKukue4Y=
X-Received: by 2002:a17:907:1c1f:b0:c20:31d1:a899 with SMTP id a640c23a62f3a-c246a4ad97emr419311366b.4.1787296349036;
        Fri, 21 Aug 2026 00:12:29 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Aug 2026 09:12:20 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 touchscreen
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=1373;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ce71U+Lyj7zFttVA4Kn65SW6c32KT53zyzKRPu/mOUM=;
 b=ShyNO9D6xW1RkbEp+BIy/OyUkLlvVM5Iu6qL4MNIYii4HOCsU2rcM5jSRafguIYleAndUwYIb
 6x1KlT8oc9IDDcP2ggi9i9ShfFSfvXnSmYe+2q/vzChlv/IVtJKv9Da
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node and pinctrl for the Himax HX83112A touchscreen found on this
phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08..ff609f7e1796 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -626,7 +626,19 @@ &i2c8 {
 	clock-frequency = <400000>;
 	status = "okay";
 
-	/* HX83112A touchscreen @ 48 */
+	touchscreen@48 {
+		compatible = "himax,hx83112a";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 22 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2340>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c10 {
@@ -1117,6 +1129,13 @@ platform {
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio21", "gpio22";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
 	qup_uart1_sleep_cts: qup-uart1-sleep-cts-state {
 		pins = "gpio61";
 		function = "gpio";

-- 
2.55.0

