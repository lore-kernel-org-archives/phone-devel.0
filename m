Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A593043D4
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242761; cv=none; b=MuNwKFrCgI6JG9nLs+jTTWesARgLBONckQ3q2suIQZhYSP3zn15/++aEvSmEZjHY1/cNahdXRwcH7T8Y9sAeEk0vRmLuuN+eyOwQSUhT3kXDtX9C6VTseKchagLWKUbnyjhovvn+lkjOHgIxZmPFyENhK0w/FVIKvpfdQWFtVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242761; c=relaxed/simple;
	bh=1Qrepa0d79KDRfqWjvfyl5ebsRzMz7XsX/QwuRAgnRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQIEFqeuCmivatuvIfgzdfh9p7iueeb1hWBxWqC/JPJ23uXXRHqtz8fQnpkVzbvUYP0/aeXd765mQonIVUQOVmN5Hs9ZUSTI4gh5yzRgwsetW1eHTBu/qBt5vi6GF6pkQv2C8wf5qYl5xDGUSF/6OWEmbPBB1+MMe9Tb0LqRQlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BVN7y03H; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BVN7y03H"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7322da8so1177024766b.0
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759242758; x=1759847558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nc2qQ87H/zk/puiJyILxc2v8deO0t3zigh08i1yQUkI=;
        b=BVN7y03HQhtgUnLFUvKxIaeP+AxOaDSJ87MXTDCoh9N+mPaZwLqEVJX20mCLW51rrF
         PqylxLMIHBFKVktKVw7zPsrEW+CtbsMoqPhZNtKGsMOBPzVbeWHK9qfYgenJX5Bjp2xg
         kfjJvdgsY8x3yQboGWweHeQ9ecm/GG3QG0yEF3Tq5rROpy527x42Hj05KPEr2mmIZIfx
         7lF0dMuTyC9d9XG0TQBenx1mT82sSi+Poe1QTQ0kVipLR1qAcjoTXPYFhO9FFQ8S442E
         NQzAZDyuPsOa8dxt/5RENqfGMcZv6cGoPVy8iz6tB1HwbhX6F2SftmrY0MGQmhU7p/s/
         aUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242758; x=1759847558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nc2qQ87H/zk/puiJyILxc2v8deO0t3zigh08i1yQUkI=;
        b=uizcVm+Q+BzBzCQ5XinkphPik93TgiM6iLxw4+D0jLkLcmoowiRADO5B+PfZLSVHmL
         pONlfwepa+cWCllwtVdiL8X7knBpykEUJDKYf0cMHnInHjZB/wzn7Q0FvcTvnzqXeKVI
         2Pyt7gHz+8FX75YA9Jui3F3A/6PtZr0gOm7zs0EtOH45LWx63HWCW3RSH8kkM7g0p/jO
         k3s18CTY+9hzBAyVIzVnNoq+8X9wCR+B9osqdno3sub8czzha+AEQd3kZaHsaI+AtGSk
         LzBvXW1Rbmp7gJ5d1WrLLKRYuXCW9DSAS2ZNBdPqbSyxCTsZPYrNsk4nCJSWA5DeF0G0
         kzeA==
X-Forwarded-Encrypted: i=1; AJvYcCWEAJ5Nf3yxYKHFIMIa7tj3T7XD0NMbUFZHuGDuKCSFu2bymv8bKfPSStsL+KC6ggSX4jxdUGr3QHhx1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNH1QT7kEi+g7uf5LgsHLO+NakvkrxCDl9dEJ91Smv7SluFPPu
	V75yA8NaKKeQrpKnQbx4Jv13R4Z6UN4Gsm4JgOdBcXpGNbFwnarG4Z3m9H6hLrUXxV0=
X-Gm-Gg: ASbGncty2bynVzpIPv2mxJYCDO9wkAbR/3Jn2g+7FnIYamZNSLejAL/7ha7/e0AGdz6
	T95Qiht7j2zvEkfHdRtwymW3grN4Hnp1rJ2vxwACqHMrpBCldyQB2PU7D/Hcwx4rgbFqAHWzk5X
	2Kk8XKDMhQ99agSo+0krl16InaH4QF4vWx5oDc6MvogSj+K6859DlL3dZlj9Ds4XoQEkgb9bboi
	QX9RHTT0TMC0Q9m2kZR90tVw6CR1kTmKiJuxFNSOaMEIc5ruO5qURLEbVhszm64LwFTszXa2Li2
	2JmoAcmra88F6O6rukF65tkERnVSc9RcLtMOVieQ5qpugDDY1/HlVG/FvXkatt2eXp94hzPNw+Z
	c0psSRvPvRjfVRwkNTh7P+SM/LtZg3NkM1++PgRnzJqd1nRQ7bmF+rV8HwWIHm51WBuR+V0MXQO
	YhuuTAtBcWDQmntIdpxQ==
X-Google-Smtp-Source: AGHT+IET9ttI4eeiZng5G1T3bEUZDSD1oiLBh/Po11ld0hjBgN7AzeZt12fBgv2zC3YDhmr21o8uSA==
X-Received: by 2002:a17:906:2987:b0:b3f:3efc:35d5 with SMTP id a640c23a62f3a-b3f3efc3dd4mr601458466b.15.1759242757421;
        Tue, 30 Sep 2025 07:32:37 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3dc2cf61dbsm499858466b.29.2025.09.30.07.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:32:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 30 Sep 2025 16:32:22 +0200
Subject: [PATCH 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable flash
 LED
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-otter-further-bringup-v1-4-7fe66f653900@fairphone.com>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
In-Reply-To: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759242752; l=1003;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RjIAYSDJ30bwj+KTioQR2VwyMimm7reXWwcHGX1gmD8=;
 b=GpnS8IMJcURHkOIJRLK8EmV/KIk7v8nq402RU4bIIbHmyoe5zj7rVpUSCGp4sh0MMyPGPXoUr
 Ee55HLqiVajAlW4j2Iu+pzNkj3Q9dgNuE9iXm35GVrxhwZjFSOp8/tS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Casey Connolly <casey.connolly@linaro.org>

Describe the flash LED on this phone.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index ce794ca724db6deb39f7fae47912c3fefe974573..36cc67469615974c193ea3a9db1b2362869d56bb 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -619,6 +619,19 @@ volume_down_default: volume-down-default-state {
 	};
 };
 
+&pm8350c_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>, <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pmk8350_adc_tm {
 	status = "okay";
 

-- 
2.51.0

