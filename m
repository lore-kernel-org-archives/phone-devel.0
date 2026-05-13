Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4C43B8407
	for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707566; cv=none; b=VuIm+Qm3tRTSaJ9fNJnQ4ENAKCWdu4SiThTu5UoqRwoy0FoqH9axw6Fxt96tlpbspy8ROqHGlzYAmTP62UdnMJnKSaW4fSBEjw4QP7+bnB3CKJcBg7nxeVhZ9cAkWrlb9EQm2+wlXozoz2n6uQhmBu947nAocXFGFJZH5F0is5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707566; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhcnLPL+DCXQT98fNPJruESVZ0fVZG4pVyIF25K+pSoAEjNMUW7NZXpkzfbt0hwveQ9XU/D68HJeaW80CGmAoxBcgJVz4wKcblXWLaD5Tat9m7IU1L/K6j9v7/CavfgcYg50DHsQfuC8N2/tF5+4wOslFTjJheGQb/pug/LTeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQuqohlK; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQuqohlK"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c477a3278so7780958d50.3
        for <phone-devel@vger.kernel.org>; Wed, 13 May 2026 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707564; x=1779312364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lQuqohlK7z4Fk55bjl0NZZAObXDohyNSxVbRdQA7mB0duAnikSTFQHacnFCdg4bxk9
         itK8l6YVA9zFdtJ43ohraSl13dD+9A/76AuGIOImg6lubQwi4mnOs0qPPUWBPvuzzkSl
         tRfJZbb+NGCpPkTXzfQgH5nB6+tDkTN3psPDTY6YP3iG0jNXVXTra12zwiMMAw4ayqa7
         ooHF5A5CibhpjWWVjGb1r6J4jpJltAim503s/D83te6Rd/S8ctr67v9M1JqrHcFZFjzY
         XPrUfAMgwV1f7zknfN8ZJ4K+GRI2nd50OINP5O09c9w2UTMCBC8wUXfUOhwcLmRQClFV
         q1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707564; x=1779312364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=jZL6NNJOitV9jHwAHBbOgcgkaMvNcYQ55ZuMLJ51KyFylLour0t//rQ/JvAcqkRRSo
         0l/HJXmZpw9ywWJuVRp5+c2n/TMOCxDnBpSJ8MimvhYxduW5wOUCzTYEwGo87z5LkUQt
         NG4b/SbHhXOIz4g10c+2t2ndpNvt+ooTjwhVFfj69czndZWgrP2GsFNbsBmbXf3Oa87k
         mnBNfJ9eL2fCWTQVXhYXTbNQhQ/Mfr71RtkiRuszQuSViW8zgFIFSLpIm6SF+7t75IOD
         Z65tsTyf550F5vXlvagMMk6hkC+mB2B8ieNnsHzhG0+vE0lquEs9NhYXij18SRLw47pW
         1INw==
X-Forwarded-Encrypted: i=1; AFNElJ81UY4YQCGtDDysqIg9o/0WCKqkuM1Xz3aF5Lnm9+seSV+XmeenClGNcqqjH7y/4O0ggxO2Ewe37vovHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDc7FEK7WKHLyOABgLMWv8zI79lpFQyBW1Lhr1T/LNOdqdJRu
	eZVEGL7uy541u6mv/WQeOGe06If5WheuR84coJFmR/4TMCYDVrnLeBsA
X-Gm-Gg: Acq92OEaJVjEY1TpOrEIZrL3Ovzwq3YVskaaQ7g5DJEtJjFPJ9nnK5XQzH1gv1DXGtj
	Bqbt5/RC78DOTySsk+2WCOhDpA95MQf3J9r4lnHUJ9meKctyZ8dRtYPGHYur5338wnK4IjpZ3UT
	945aEJHFm6Tskw0K2SteNZ6ect0hFUpqN6zqZF18PKyuUkegHEJXbVNhYkx3G+CAsZKPODhPMpB
	SlrBbZLTFLACoP452pC7pbgEzFDIvndMsas0A+NEcbtARgaFt11O7GldyM+t2vc/eJ55Yf9YMt9
	7fXjVkFMsEYPzRpMCBGhGn0tQkjpOvFmoibApTqqIDEnS7+J071QtGuqG1WCoSJIwczPZc0mmdA
	9KiKCJS8hfCXoUmeiG9eWr7WwIK577QY04UQkINK8xcK16vsmPsKuFkrGBbpHhDIDgb8FmjHCIM
	xEhL9EoIGQpv6OUAdNsxMmLQsmBg==
X-Received: by 2002:a05:690c:4d44:b0:7bd:4792:66ef with SMTP id 00721157ae682-7c6dc7b21b1mr47195157b3.42.1778707564477;
        Wed, 13 May 2026 14:26:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:33 +0300
Subject: [PATCH v7 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-4-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
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

