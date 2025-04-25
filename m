Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C6D24A06A
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582039; cv=none; b=B7mBziSx1XfPADoaUxyjWsJMaTJLQKZYr3UK24OPRBwNZMw17d7lPeh5qYuA2IahitbigMxKkxyeDxk7LOnNNnJfXyHWDiSjODzuhhx637AcD5lAUl9TbaI+Hdj0rqmWkuontURcvoaxueNU+YdJzy568SgYt5rLUHnR/W+02Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582039; c=relaxed/simple;
	bh=IngzkbFYDjc7fzC8Ve0Clm88ktm5CuABxv1jFdJ+raM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCOkr9MuowUO26GONvAMxXh16kxzGxPN7LWa3JCg6Bx6Zm/bIuOoeC/XQAYgHg4F2G6QDW075WVL+9dcfEeOY6FB1QXcDqGKxqT2LNh2lnpMOAH9ioIlwINoWDeiyR3t/wAXdGpwiDkbMr+R1cynPchsipXP3yEi7EkRYTqoii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bubWXRCY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bubWXRCY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so3981692a12.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582034; x=1746186834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZlycJTtKna9Dc90PkCHXWdnUH/ryxREv5nieSE18Ic=;
        b=bubWXRCYVHS50nbRrpZ/PmbT1QKoHXekrFW2j3hBkq6NdTvATjRpT2uLbJ6a+mz6el
         eQtuwpABK11x/X5kOln81u0Kgtru0e7T5YWjeMJt0+PeCGQk9alUMnnCQRSn1voYKA9M
         waUZ9jHpHW7bY2fmRFmJPXobb1VeR5r8B3t7rVmMrihSHCi/T2kr4Xbigy4xyyTJ/ljf
         YeKdNC+7gbA2uXAjFMAeHckQJnGx8mK08u8vjFqVfgsuKApTojaAXIOS6x3Od749OWkh
         KRhJwTwQ+yNrLRX9LijcC1/61kpeemP1tzNXqOH/DU1TD/VPP69eiuyZk80WMlORetkD
         hPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582034; x=1746186834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZlycJTtKna9Dc90PkCHXWdnUH/ryxREv5nieSE18Ic=;
        b=Pc5gSKNiDT3rdsDQmimscj0j52wMS5brtowFZkxAN/tbpY2Pi+Q7PiXkMQCKeNCSZq
         CaLq06ZqFwi3ieM0IvMG+5tEjSvSl+HUgEbEydtFdhA+ossAVFrkpMNhMM6wVpJ8AMrU
         kDMLUGh4FKVj4j7Zr91DF7eLGDSkCe1c4s3QeRnJUm8y7OJIjnJfyo2wzEZoiqb1JS5R
         5pYfOcXYqKYYUeWwJ+4Pw93i4HGqGrhucFBt9X/xAcQq+ItZkwJ/p+qiEMT2zleevqYA
         c6JaDYc+pNTwAp7f3j/U4WxPBDkzxMMERcnORXdlzzR+HpaxXEoO0mGPoM9mRKLdqPcD
         onhA==
X-Forwarded-Encrypted: i=1; AJvYcCVriI7Q0rk5Evpn0/R0mOSckJUkrEyg3CnSfbuoERmcHREX+w6YUMIIJcvuJwklW3N6Su19LLg5a/5cTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvB7ZfP9s+xzPwEb+82Ck1wn3rqVOQwo3lsv2h3J7g2X+lw1D9
	/UmpET51iOs8+F1kjXRiLa44cj2+Bp5DBdIRPhxDaj1oSYe+0VkefeSyiimZHwI=
X-Gm-Gg: ASbGncvp+RF3Wyf07uJK1DNhNjq+tSgC9OrcfG66TCHP5FDzdhXFIzpi/5rTqDhnxbu
	VtQGMbEn38EQA7bBKZs25hN3OtzL9W8iFQS0wxFoQP2sIEGNEEAx2rAWOYkuxoOr9mi4cCnsdlH
	54I0bbhp7xWNh/zaRXpbCvh84blEMi4/n4Vtc5bK6KkFM+Xa4pONwWgWuNCzVD4yRPE7uRpvFJJ
	NZox6hrHsGXhmjZHyqjebdu/yjSJOKSixscB4s9xj7kbbBddYI3QmAlUiC4dL+Akbm9SQw7zExE
	2tcdzr7FWi/AZf9ZLEnc/NDLT4jUr/1j2gbsw9pR/h6OpUP+4iv0nF52iPThA0JexPUHfwSwgcE
	RVDcFk+8c4Gu1uWe/nBZVLlNFYgsktRjh/xdd7+IW4IUrEMmigQyiNMmj
X-Google-Smtp-Source: AGHT+IF+6VfkmfiBlwrXoh8cImg1rfKXlySdKmrFh1035IBp8Dn3xkJmmZNnuhY+ZvhM46jiLP1lhA==
X-Received: by 2002:a17:907:8693:b0:acb:b0f4:bc77 with SMTP id a640c23a62f3a-ace713efb5dmr193451466b.57.1745582034612;
        Fri, 25 Apr 2025 04:53:54 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:42 +0200
Subject: [PATCH 03/11] arm64: dts: qcom: msm8953: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-3-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 4793a60fa946195d3220b6c44dec170d443f56db..28fef68f7348b7f59256ab1ec9370241612d254d 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1933,19 +1933,19 @@ q6asmdai: dais {
 							#sound-dai-cells = <1>;
 
 							dai@0 {
-								reg = <0>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 								direction = <Q6ASM_DAI_RX>;
 							};
 							dai@1 {
-								reg = <1>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 								direction = <Q6ASM_DAI_TX>;
 							};
 							dai@2 {
-								reg = <2>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 								direction = <Q6ASM_DAI_RX>;
 							};
 							dai@3 {
-								reg = <3>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
 								direction = <Q6ASM_DAI_RX>;
 								is-compress-dai;
 							};

-- 
2.49.0

