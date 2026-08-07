Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E9744A3FB
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 12:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106064; cv=none; b=J2sgg/jjtncQpoy2Ut9yoNKWWDvlBv0dkZS7DswOcoZTV8EXnUxN7S29WcoUZg/AWH3Wgb9uSwzSAvvXSGdaN3+vnAzgiG7MpsINxjEZxTD6pkg4SPDm6tg1ME1W9I1K/GlhNtt2smK9+SSjHj4rKmXS8rUnxyHQBwbNDtTfiEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106064; c=relaxed/simple;
	bh=Lh+SwH21jhBJph617FXvRF5JB190/NoNd9H1iE00Q2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5RR+ARY8o1yf+EVJT6cet/NpB/Y6DjmyaT/99u+HdCRLBw1e3pvcLHQE8aK7SBKOW1aOoZ1HUVBGHMh2kOTRZg4LIc/xWqfAnNx3Ei9TV9QfjsEylF9jnNQ8M59wnLIVFzDjAi2aRaSD6EDCgMuIWyaO/+dFrmQ970kYAK9UmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZM/YNzf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZM/YNzf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso16249545e9.2
        for <phone-devel@vger.kernel.org>; Fri, 07 Aug 2026 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106055; x=1786710855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=qZM/YNzfgfmh3p91ZjDtiTJpzt+BOHuUQP17HLTCmBZ7OCHfY0lMSTbhhZ4AE2aHoa
         X8I3AOeR23SbSldLZHpMNHaR3zWFZnwA+GA+GWH7jAw0JM6ZPJZxkxF6htFvdiNIquR2
         mkRH/FqwM9i1Va3SswDoqwrNe9G98nz+mQctYgCEOnWt62bEzTO4Z+yCEL89d3TkhqHO
         DpQdKeVWgcgjPYKJ4qeWTgWzCOBZQIteE5/ZHhLQ2T/nN7244en5YZwhPHvJ2uW3xNo/
         2kTbNbiBfg6fyk/fJ3l5qds3vfW6VwE4/+mMPQywZ/m0bO+wUq64+VWtoub2bjgaeIQ2
         229A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106055; x=1786710855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2IuLo0IrIpLFjdkCWDq0IoYangZfYaae/T0dXFNw/g=;
        b=eVIiXzjdRxeKDZw7veWB4yb3HqSVkLNsIfVyMinx+wkXy5jUACu+gP0wZwOK1Lfg/M
         785Wo+vQuAUQBUPkbiRa834CMGU5N/c4A3XAedxce0z6CR1V33rVqm1+G1mJ2hmYTK35
         lXybwM350hBHCVysMUR1G0+A4/Sa5XqMAk0oGJ6khvFzL/FymV9iglageS+nALpVqPKH
         6UFmNctms43npSC/NulUK083VOKHX3CrxRTsbaLcrlQsAUV4GUez53ZJBOycvuLD7hsb
         sCwSXtfmpWSvq/0C0NDNPmz05kyxqeeE1/ZV90fQ7fHttYxNRQ9ZRNSr7jppFznFAkjm
         ivVg==
X-Forwarded-Encrypted: i=1; AHgh+RrkwGGub4GWwy1+KArc4G/Vxkp5xv6HQ965D5jqMxWnDJw6Bz0SY6T2GUG9x5/f1/KzffWq++cW8zFbIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylVubUIe4Qo9cgdKTqgd4DoM5C9vUO+VbJZfiEeIHtYg7posCP
	TLjBB1CCbowSd8To6JW1kQBkGtsGMAyshkKBWSaNrc9czGmG0IQXde8c
X-Gm-Gg: AR+sD12QddOyxgYL1yjMh7ltoQUANnkqG0g9zdK+SGoGZLPDqF1WcneJCoJPwq5Bt9t
	vKgpk4GnDzDJiI2iSrk5oL1+o0T6ErhNKEUieYWtp4UwoM85wDiG+WIggtHIAkH44+lmvpAw36k
	FpwRHyNpN87L6lTXfuFQRaXMmBrXu1CpmW7TJvCsfTFymLwaU+w0qgUyNOEqbW8rAVMNZyqRlLw
	yt9eSJIUBqnqOG5rXG7DS+jJbmtNILhw5HfJBRrWXz7L2p/J5LY4SUvScHm2zz6+faO4AI2XaTR
	iYhTYqmTF1fZ+FyqD1wHzDT1DNdhvsJXWk/5eKMeCBLhuXRmIX4zttuMYb6M1k6TRWv+GDTcsZC
	MF9B7zWlX8hofBYexrULGA9QGQmILfOniEt5E+eSwMjlff1suhxMeuxttECR+aPw7Cff1zuy/aZ
	Mnw2LS10nbkcg/HCypVE1ga9Hf9Ne9zVN5I35SA+bDT8C5OwqOlCpnQ0ULV5NlHbRGQlbu0K9LO
	FY=
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr299435775e9.11.1786106054801;
        Fri, 07 Aug 2026 05:34:14 -0700 (PDT)
Received: from [192.168.8.167] ([2a00:f502:270:d465:a26c:adcb:8da8:6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdca3ddsm49530495e9.1.2026.08.07.05.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:34:14 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 07 Aug 2026 15:33:31 +0300
Subject: [PATCH v3 2/3] firmware: qcom: tzmem: disable SHM bridge for
 SM7125 platform
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sm7125-samsung-v3-2-ac0139e5c612@gmail.com>
References: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
In-Reply-To: <20260807-sm7125-samsung-v3-0-ac0139e5c612@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Vitalii Skorkin <nikroksm@mail.ru>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Currently SHM bridge causes RCU stalls when booting. Disable it for
SM7125 until a fix is available.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 0fd9581275f1..91d59e3e5988 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -82,6 +82,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

