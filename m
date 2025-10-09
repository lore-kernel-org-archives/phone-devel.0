Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3C2D8393
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760000813; cv=none; b=rp0P/+7aEzsxKFJn4ZLLbQQtX8MCdSzu1wjiyzyEmXOTmR5rzhlknCg7gPco5ZfWLcZNqBtzOaL232WrdPXmtivQ8hPwq3SsDtNJBpeZR94kkMnJVcvXAhWP6BdFbCIqf5ku9Y6ko3qyNEgze/DxtF9K+mLEYmJzj6MiqKc4/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760000813; c=relaxed/simple;
	bh=eoDXime1aNSf41VKrWKqA9W9Sa5Zt7IvwdfTnUqBwWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcnLJioKT9Yq7EH3jaLVYCM6BejklGRFdHBl/kQ7I1WKKem1FSNnz1ji90bCHWNchype8NUpOvNnDcro2ZfcAQvtWMxo5Zjgvj9pR3+NQcrKe9I1DaY3dS2M6qvke/Uhj7a86YS4/hBtwQDM61NNPXdZg2GN/0grsasp6ZaQQ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LwwPdw7N; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LwwPdw7N"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so1297814a12.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760000808; x=1760605608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qacc+aeH081mkpeq0qtJjcgsPMbMH7mykJcba3R5N6Q=;
        b=LwwPdw7N3egRw4MfD7pe1hicZ2wlOpqsYAxrXXd7LEtom4gfQ7y58awj/aPdEEJ/qK
         5Te9P+DBYmNgCobg/aKKCG32uRF0Bz8xRdyiZ1DZHJsjeFooYbuguIRIZljLkfxHaJfy
         eLv6Ug/GvVhcNIgjq3UZItzZrc5uzY7HvkLyWv9g3RpufN6KcW1NlxHm6oas0ekHzbFw
         63uSNKLHat9yK5TfutbI0SCxxp8+pMR3FMzQT5sjXoEPIOgOvjZ3hmVZs9ZgOozL0sWb
         mLMQYH6jjiljBAbkootuZYB4W8lP7NjrGzvEJTaeLB/d9RdOjK/19TfRS5Au49hhkzJK
         HePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000808; x=1760605608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qacc+aeH081mkpeq0qtJjcgsPMbMH7mykJcba3R5N6Q=;
        b=B4YroLLifuXfEkj9IiVlg21FTVpx7m/9786414YyRPuuhM4OOSR+KCGlfkDZEfVhDG
         +t7CDr5JKqO1KuHdLjncpi0yKRh2UlqAFLla44HXbQ6D/dTW7P967Hwgl4Ra/WfzLssQ
         i5LXCU/4GdCMVHzjuVNMOxCv4qpK7nTYrAXxDQnETErAncdmaoH8w152cOE2xCc+vQOA
         bj6I59JBflCJhUVxfrw7yESpnnIJD5WGZe5nqj/MHSpsGhiRiLCyPhouTTNBbtD++AbE
         2J2DjJA5ayAAn5qEh2MCBmucjesCWW2u0HCwz2TUq2tb3lrqGryE87rPkm1kYEgW7ZAe
         JqQg==
X-Forwarded-Encrypted: i=1; AJvYcCV2wny3EAhK+JgQQJkJxQcvgYn2xZ0nMZ73vsivl/uZNGN1bGDkJdDHV/Uk54u+gUDwATgy2e4YyYOPdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqBM8cFnum0jEBdcFOU2Fn8eiWgBZI0wvUoQebEbs7ecJCFkD0
	YoVZnm+wh+RkSgGzrOob7W33vbNvPWv9k8CR7ARlOPWE8g2cXTkbk13TdofDYF40U8i5iCoTbsn
	DKLszffI=
X-Gm-Gg: ASbGncvFc1fbDwbGz5oNOdeiCiZ9lr6OD20DoCfAJiBDsFfXw3+gtOCfdyZeuWMt3zF
	+Ro5eZHjipjI0ZJtoE1yiM6b5T9aLfPdKs37vEphvcTtvxWlPD1kezbYtGRBT0qMHQo1d8Jek9X
	8ODZvkS9HfOAdGIqVR4lmdC9z9oWB9II/4b49wsoNZNLIPF5otikOJR2EsdVjYG9UyUIV4LzOlC
	GG1Rgzv1FZ1KKCOIeZYdNLEAG8yfMQ0DBDW9KaPHMgz5940sadje7SITRPpQ7WWsHoP5otENNm5
	OIUviqT5QucP/KPvTrSkHeTu2tUNiJe7T+s6T04wgNZsmn7KWcHY+6GnicEzwEaAYfruukjFJzH
	XHLsCKfZqKgE8DL5ml944/dwl/tpMU0sR5rCtRgbIdtWR1Qjq7TKQUmiGhkW9tN0bspGT9CjXxm
	S39MEY7AkFEC6U8Z8aCw==
X-Google-Smtp-Source: AGHT+IFYR8i0mrRw+zCNEV/pJoxI4LYGMGp5GEhXLNZfBhL4V0B1OriyeP/tbhf2zus+NefeB9G68g==
X-Received: by 2002:a05:6402:1d4d:b0:639:fd55:37f5 with SMTP id 4fb4d7f45d1cf-639fd554056mr1180673a12.14.1760000808515;
        Thu, 09 Oct 2025 02:06:48 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4109046sm1905755a12.44.2025.10.09.02.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:06:47 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Oct 2025 11:06:34 +0200
Subject: [PATCH v2 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable flash
 LED
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-otter-further-bringup-v2-4-5bb2f4a02cea@fairphone.com>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
In-Reply-To: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760000803; l=1008;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BxKFS95w1jXy35yaD2QFxAG8rJtE2kDnNaQVe3uTD4Q=;
 b=x8GqfoiMS7G+7JxFND0I9CxgJgnfeDYrwtV0yTVPxM+fe0P/ABKAFPdpoq5tfC+BrT4YAi2KN
 342Gx22/queCZoWhWVrxOWoKW+jIszc37AMo6FCvAgqDofedD+A5pSG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Casey Connolly <casey.connolly@linaro.org>

Describe the flash LED on this phone.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 31650c29b1ca..ac6ed79e57b1 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -605,6 +605,19 @@ volume_down_default: volume-down-default-state {
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

