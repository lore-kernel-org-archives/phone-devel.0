Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A735F2BB0A
	for <phone-devel@vger.kernel.org>; Thu, 18 Apr 2024 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422242; cv=none; b=KhbrkvCX2JhKYgXbNzehlmYig1s3zhPkvENnzQHYUvpBiMOxmnmgo0q6M+GFuZAV8CbqlHnMRNS8TLC1an7i6vYPjAkCPc5d8Omw0UDP7e5wMCHYt42ijaq7iHzSBy3pcHGR740Czc4CmJ7em3IUvVIYzgDXNUsUSsa9mR7uwdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422242; c=relaxed/simple;
	bh=kT60WxnXzrxY4hpdxhmajP21sGsE+yA6ZN5cjdGB3gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwnXuQ9TAOWgSjMpHzppHrOZcKb+z5KVIokemRvZFRt8soKEM2bTWaeHEdGN3mzmSgBiUfZ2D/GgRydb8kmWLgHgZDP+Om6lGXquSjDZcu7ufVWPhCab2aigV5PtWKzH8UHuOrGoGYiq+sEij7tqK1xvNmV08T8Px5uEl7G3fS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cB1QfxwK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cB1QfxwK"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so608060a12.3
        for <phone-devel@vger.kernel.org>; Wed, 17 Apr 2024 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1713422239; x=1714027039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JvkkKzbM6G7xJ6mlKhxNlJTYC5/fgdCMmwInuXlV88=;
        b=cB1QfxwK6bh0+p+136MfmNnicxqK0ypqlHQpCpAHh+lpjQl+ahWV5/Xdx8hrDOElj2
         FTbmR2c04L1CSAisbOHgammpedFxCvY0Sfpkzt4lKjUUZKfhHuQBBod3O5+uiI7Qtqmd
         7lFKLZjJjHXYiF5M/JLfS2Wd26uGU50ZAF7iBUXHQNFKnYtY+Xi1QQWw4B1F1yA6paZ1
         F4S+CGZj/GX+CrZBOdeYkD7hSMkuUqFugbBX6uAcHshjO8kyZgJl0SIH0ZClQ/ZpqHdu
         SqnXa7pkx0A8NqwmcJdNQiqNnSKoyO96v3JJOhOhBWmq7typPWXeLzWfJPv0RII0hEDJ
         7xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422239; x=1714027039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JvkkKzbM6G7xJ6mlKhxNlJTYC5/fgdCMmwInuXlV88=;
        b=Hm7cfBA/+dvEqHgk3Zq3xF+FDaNZZHm1tu+sNWT0LvfPk2AliQg9m9JPmc4tXa/MYd
         V0FdXI4BsqtaS/4VOAhGVphF2WWo0al3bcoCI1180A6IFJoGDaVrDUedWKjrEb78EB62
         nJk9SPLaav0aKwvWsWUk+7qtWWrJ014/VtnWG6clfPdb6oS/kgbSfebRj65LdTrqG5YO
         TAlQMZAAHIUI+nxSr5VcGv3yHlwASql9kCAvEXVt5kiScGQyc5xSC0Ncsnswg/OeKjTJ
         +P29tEdD4ei8zUN3/H18SyWuk2BR34yUzHkB4jWyWFnspcaI5DO6KbMEGGe+gQbwlIDF
         KlbA==
X-Forwarded-Encrypted: i=1; AJvYcCVNUz+n7UG6Nzo7GYemM3fWudzDy9yK1zaEKPzMpC0hB54GFwuWEHp+dNK+qhQ8BY5vCd8WIV44LvpR7KOXgqACtJ5qUgR9R88BLOE=
X-Gm-Message-State: AOJu0Yz3ztg5A24sKUwbnHs3byFJvuhsQjlST5h2Vo0wFVLbjwQoIIFM
	6zWHyizAbtJJR6W10XmCENvgwBfwDcy6z8PVlY68HuT+qG8CL6LT/2sQM2zYnrQ=
X-Google-Smtp-Source: AGHT+IEBi89ScDQrEZV417qfSSqKe4JxXB6rP/2GI8INLg+6lM4PM1KvguFm97eMoamsK4NSW8SZNA==
X-Received: by 2002:a50:d6c1:0:b0:570:db4:e5cd with SMTP id l1-20020a50d6c1000000b005700db4e5cdmr1031014edj.34.1713422238910;
        Wed, 17 Apr 2024 23:37:18 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id cf8-20020a0564020b8800b0056c24df7a78sm472277edb.5.2024.04.17.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:37:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 18 Apr 2024 08:36:55 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 vibrator
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-fp3-vibra-v1-2-b636b8b3ff32@fairphone.com>
References: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
In-Reply-To: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Enable the vibrator on the PMI632 which is used on this phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index e2708c74e95a..2c1172aa97e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -143,6 +143,10 @@ &pmi632_vbus {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &sdhc_1 {
 	status = "okay";
 	vmmc-supply = <&pm8953_l8>;

-- 
2.44.0

