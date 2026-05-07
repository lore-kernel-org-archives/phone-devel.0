Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9E376479
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142838; cv=none; b=SERFPVwiWtyaGCv2fP7SwtpWekwUc6vKsK4CUcuITEd20LBr3AppquycUmPM2hz/ulmcKeR+KLNKgxHxMy9xtwFgXbZ7DDWRpWyqim/RD2tiuTKR7YRwQ5Qm/VI35lsu9hGGZU1ygT8oeFYmnyZY24xer6EoFcm1xbCC+Qi+5xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142838; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1JHA+1Pwcyi0hYNscAfPnyIUTyrHh6MsjiLQ1VsyNBQkZ/vAf4BDeaRmLlmoc1FUQTtiQ8hx6nN7/bR1t7vu5FB8Ki7FuCDWALIMR28IQffufUWkPTYPuw2ONuejQ4VrEe0A27aZaRRcuOTvdx3gjbPkkdbUJzvD56azz4ezTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwoG1hsS; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwoG1hsS"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7bf02533706so5135017b3.0
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 01:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142834; x=1778747634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=RwoG1hsSRhinX+dYNPOsRm0FVWfUthen9uk6CI8nlMdec/tM2wUmIlUYiOqt736F02
         ZHn/GNr//7AsdT5G2Z2VqLzJzHzrR1qVkt4ygynyLcPglQpJnfzLaAhnkmIoM8INBDFk
         ce8HFNj09XXGJelNbFyCVK2H4tbiVQGU742DTmd3oTo8uyBiWGU8lzR9uBY7w1MDyHlA
         Hl7gAKKaD+pKlNkkYZDL2IqQhKTbQ95AsbjDZJIE3Yk0IcRaYF3ne9xHMMfI/vna4BiU
         4aZHT+VzbviX4tm6PXlgwuV6+NdRxYF17Zt5tYYxvlv4Jl+qCTAHCOOjUNTPzPyezb/O
         IZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142834; x=1778747634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=W/p7IiETfyQkKfSvnCu3atiBDEY7lwQ8s+BxfQXM1ChRI7xWTMc6Us/0sLuU72bhCz
         fAfKxnWCC9fCTHcoUoRt98mR6/+Eyi+nD1HH/LEN4R/PScrp4XfVsXRsAyxg0vT1Dbat
         9W7JFKQ9GnRFKsYwU9gn2h4Y6itkUjWDbLw+uWtRzqD8TcgyEnaOQm1kk7RheXBvyU/O
         V+XG/clxVcYwqgDRzXlPPD5oPThjV+sMK1hGlr7lZT5E4JxtU53Ch9sl44G3002yfIY1
         pFLEdxF47omBOwIRgIZvW848c10YibaIxYHIqL1jduDrzKNuu1eE/nnHJlCxJiA1Xdbd
         c/gA==
X-Forwarded-Encrypted: i=1; AFNElJ+bpTh5O5OAZjD8ECtHMtAYP+yD7FQoMF70ECoHaXoPCLpol1TxSO30dZ6FJvjSEBJLDPnBs7FRJuqYzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51ZHuYY0gxe0xEYSXQNIp/bCgKziot1WTP06kcIW0sLe3YY2i
	WJ4rpvLbXkEzHwuqDO1hkq5tFF3PqMoNtx4irkIzM8UpTNn1RnRbB9u9
X-Gm-Gg: AeBDievsb2sEbRBOoFJZNqYDOoWV2PfsbkWCJ91q0iKABJ7NH5W1gND3UHKUEFu11zr
	XY75nkNG24/WHbWlJ1V8VWhzkzaVqdg1lLWDYlRc+IuT6nki0AhjoyKWXuxtHvolgXBBOsR03vG
	Rm4uoIpw8Gc3dDohEK27+tAvPXwVPyDk0DT1IDaGTvGnIHh1bxA98WfO//16CfJyg5VPYqyax0Q
	U+giFogx3CpCZJdqW+yBqBoXYnH2CVgTNbcBbnbE0GzeU0TMH6rBWZns1mlrkbx7Fk/dRG3kzEr
	ONnj2b5mjXcXirjOByFXyD3fstAPrYLhIhoBAb+0llEZdYMFThP3cVnjEJjb6qsh5VFREw124Sw
	wnanTkrwXZhlwj9hANamTJIn5JbEoiLiVoRx010eLot56+5hGUGsZGZimBg83AlZi/liDQ2xxc9
	5HNDomvRUTFdaaeIb6malefuou9fxrbJ5M4/jg
X-Received: by 2002:a05:690c:ed5:b0:7b8:5f91:65b8 with SMTP id 00721157ae682-7bdf5d99133mr75100527b3.9.1778142834200;
        Thu, 07 May 2026 01:33:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:18 +0300
Subject: [PATCH v5 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-3-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

