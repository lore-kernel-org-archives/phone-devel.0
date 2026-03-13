Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F2C3B6C0E
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417645; cv=none; b=e0gSK8LzR5Nuxz+ZsSxX4SxjLBSs5ynhTMnNojTTOr4RoxZWUy7KrYF2W5OTNIJGvQLcV8lmcpiRZFwCo6ybk/4IG23WDCjMyMI7dWjk0F8sPwTlawXec9EBNT8717RnYSIt9JM5XBnKWprWoWW96MlSF0+Q6qE0mFddYR0R/WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417645; c=relaxed/simple;
	bh=kU3UxSV+thy88CWdYS8ajqS2HsdwARkWF8FHIB7M0vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaWf+kNwJo3DFk6JxDGBsbhFN/Y8D/luGl/00OBnQZn22lL7IgpZsrJUQxoiNY9ZMaNYAmXOvtOgdRhJHSXCw36D38b8jw94rQTU1QFEdmvcjEc1/SNzr5yhqhcvLnKzf2BpUVkVGz4fISJg3zqtIc+rQgSt5ylKlnaJ3lijJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N4x7VirN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N4x7VirN"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so2971810a12.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773417642; x=1774022442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2kPp/p9iZu44Vzh1qojKHtTrTqRdtYbnN73SyFGMzA=;
        b=N4x7VirN8G348DO1TRK3fvYVlZmiKJMkkRTv4DKptZV/jozeD/9vDLYRDgaJCeB9Bu
         kDHcxTINrNW7VI230UGduKF1wlbU8gxcTcJcm0jpWdxCumte1Hl/47M/jvD08jr0u4TS
         4TDQnhFfUAc49GuJRLaidBybKkspRCklxCzMfU3xhRYEBwj3u3MaAr4iz83SSum6+3EY
         Cfo/4xe0+osxMyRR7QhuNOJL8HzwdqsEZoFHtqN4f8sXob+4ksC20BzlXZ86/62g9GAX
         hDvAtgau4tjK2hyfmCk5vZiXf5WUn4ZzWZLBGWcjL8hS81dEjUDbTr73wP6KYNvASHIW
         zO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417642; x=1774022442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2kPp/p9iZu44Vzh1qojKHtTrTqRdtYbnN73SyFGMzA=;
        b=JqDk26t4Y/x+xMQRaT0H13a51t2e8BQIbQzf9ONQn/xJtheiOIs8yyHajmnse4uGkw
         PI631At5sXOk95cRxQrx1v0NQ1wg+UFsOythB3GF+oYrzID5SyRfV+Do5/r2Pc1BT+3l
         yCUKZaCeiH7Qgrl9xKyraF5o4lVTkRbbr/vaFi8bQy2JMhOm4s2f+IyrFodMnEnit2l/
         sizOz2x+ydzUuPjlrzp9k8qHio/k6oaRQM1Bh2uNni9hQWYwmtR9f1+NhdqwOIfFK3xz
         prAn8vpecH0rSYgjnrGIFMca+O1+kr9pez2LW9HgeGL4J0q+OWpGkhVgekgtByeqXcCO
         0sSA==
X-Forwarded-Encrypted: i=1; AJvYcCVvZWtQW00XJVEkVm7RXEVE/4DUWHk5liiD9m/2O2ugSyLTA8ex7CzMr+K8O7YyfGsdNXIuVFGEH/qd0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdRHIQOaBnY2oFEYl4vh5BHeEmZ0F/JaD6SNzo0CfJscvetG2r
	70l09nOtdC11AcBhqpeeoyeWlxYfvRYJH5dmXMr8YxqnKqehDFNzW0PpMIpEiSH9x9s=
X-Gm-Gg: ATEYQzzJcoa8KlW5FNlNZwsx5dJMlKiYcw5GdDvGrYuqBZUKdvxGBzu4S17nwDAilh+
	L6PLE2yBjkQ8TBAlfvGVWcG2V5pD2lee6WMexK0ZCBbEPj4dEK3mcOljhzLkFLdmifDtEMIg0pO
	n4T6rm9zkklMwbUxE7WybTY297KwjDkMvqgZ0gWgSQ0bsWWpQ5EH8xV5YbXnjgG0HQTFvvDW3k0
	QBEAqoZftHmKrolrXoB9VeXnzZfLmMhOyFnw6bozPsCzW6caFRqM6tueJ9YtvVvTkEBW2kxC8R7
	cJ9A3B7eKAOOVaDWwm967yRI6PsEKJc0LfIkIKNK84rxCqM3PtUnR64wt3Y6YZ2FHMIKi7C6+9l
	QADIB6SCr2x8LbA8lICFex0Hq+cfWeDCTfrdpr9Gvuepp8ux4Jy2gj3/RmyYdD3kYeQ3rgMGTgI
	MDpIvvYowNR4t7Q4H7iU7mcRG3FMZHnlZJ997cvtqE8lfndfBE6VCUp5zVChvJStC83syMO3aST
	qhS4Q==
X-Received: by 2002:a05:6402:35cd:b0:65f:830b:1034 with SMTP id 4fb4d7f45d1cf-663ba101109mr2296343a12.6.1773417642212;
        Fri, 13 Mar 2026 09:00:42 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fbb94afsm1397100a12.4.2026.03.13.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:00:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Mar 2026 17:00:38 +0100
Subject: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl
 nodes by pins
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-fp5-s5kjn1-v1-1-fa4f1c727318@fairphone.com>
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417640; l=2814;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kU3UxSV+thy88CWdYS8ajqS2HsdwARkWF8FHIB7M0vg=;
 b=8ths/u7f4S7gPNmFszVyhlCsdnOU+Bf+PStFeIBt6nuBralUzmznUoFlN8osvDGhrPhsMMGy5
 QradTLd9VE/CttINqtrVxGuZiWRNLGCTCII6uId/YjPbhfU9vfsYyhh
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
in preparation to add more pinctrl states.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 455e5c9bb072..c9c24c36ba7e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1257,41 +1257,6 @@ &tlmm {
 	 */
 	gpio-reserved-ranges = <32 2>, <56 4>;
 
-	bluetooth_enable_default: bluetooth-enable-default-state {
-		pins = "gpio85";
-		function = "gpio";
-		output-low;
-		bias-disable;
-	};
-
-	disp_reset_n_active: disp-reset-n-active-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
-
-	disp_reset_n_suspend: disp-reset-n-suspend-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	hall_sensor_default: hall-sensor-default-state {
-		pins = "gpio155";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	mdp_vsync: mdp-vsync-state {
-		pins = "gpio80";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1345,9 +1310,17 @@ qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
 		bias-pull-up;
 	};
 
-	sw_ctrl_default: sw-ctrl-default-state {
-		pins = "gpio86";
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio44";
 		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
 		bias-pull-down;
 	};
 
@@ -1359,12 +1332,39 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		output-high;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	aw86927_int_default: aw86927-int-default-state {
 		pins = "gpio101";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio155";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.53.0

