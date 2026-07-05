Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1E29D265
	for <phone-devel@vger.kernel.org>; Sun,  5 Jul 2026 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783247624; cv=none; b=pTAIwQK8XBfl+B7y6hgZIulgJINM1r/ECo3hB7EcJ6n1Owyo+4WoltUz/fg84hZbnuvjqP83A/4JbH72+jiQ2/ueoyqQTuqb50tm4CDQdFx63WEYPu2y/RjbNO9PmwYC5ors6UVViwWHRDW+l7G2yteYCtKKmR7h0GkP/mt6X1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783247624; c=relaxed/simple;
	bh=lAPIbiJiqMqb5Up3h1/qudmb3tYdHGyZZmsTohHUWX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgP9vGUd/3RcqtKQ3KIAqlqV9srhPbbDB03vTCrwFUL/uFFyrZaBfVjQPYU6SeL3ul/IUWEM19xrt6Nr5/2TowFC1X6vGxeic30JGOlX1aemoTu6sHYU6TUos4RMcxGbkutwd9nnh/AmxYbj7wF5PXbXWwCQF90u8fnoqCTql6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AipTD7R3; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AipTD7R3"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664e3ed58bcso3971374d50.1
        for <phone-devel@vger.kernel.org>; Sun, 05 Jul 2026 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783247622; x=1783852422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knFj3lxdZDwXb0bBbKTG0atYKQi/dQjB9JSBw4jJN1Q=;
        b=AipTD7R3QgYhg0bnCRmy9wBmtkOD4eIIBwqDeYeqvCUFnSpD1PzET/t9RU+ZMWgVs7
         +yqExB+qRO8iLdrvXaw3THKdXQJcQ9JWH3Vc8uS11xav/8jZmvl83YrxVSDzPLWSYa04
         S2xW4D3UKVgen2J5Hgrt8/oZj7OP0uGcJEi1B14jLj0b9T0QabDiRMHWuChFrHkgfZgK
         WBeudsZ46NIs6k84h+iBvB9XS2zAd/SH1XDX6YrORX/RAMUdLMTxBxZ3cctx00sCswcf
         ltXoyyPU63xolyGAzPPJHiCu7gWYfiQl2cxStzzNMICSQXLoqLY9wQjmMKQcqyn+Xd9i
         spvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783247622; x=1783852422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knFj3lxdZDwXb0bBbKTG0atYKQi/dQjB9JSBw4jJN1Q=;
        b=EV1EmjXoLyr/FSqII2UkbVHiMRgZPfcF5YMN5n9RQRsqv5RNx2mfif/7Gn75qJTobl
         jVmr7ey7GvbY17y6Gj7A13N1OPLEHKyhmTjRsy93do4cPJy3gjUo2n8qcMKQ5vb7SZC9
         DKT+Q4pyddtPGw4cRBOkurihc+ajIdORl3JqPOCkDpS6QS1BehP/WJizi/8M6tVeFY2q
         KiAou4ds3n/4zLU7RGvyhDKFBlVm7mjZVlASGnPK+Sr3mwWj/O7KLXFJ/NSoIddv+C5Z
         FZr3P1YSbL3jMM8rfpeiLpM9hkdpdLpzCjooUXD0gByfI33RmphIpZHJXoJj8HjG2SCf
         V9yg==
X-Forwarded-Encrypted: i=1; AHgh+RqBSR3F5PzTUpltjKQKIxA82Ac+8XBrj5J/P5N6eBEoZ0H9CPTtLp4L0cth+zKebZwqGYM8s/MEYNZIsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCdNFUt60Vv4u3Im8Pzqjp4lQM8/BmmI32TjFKYQJFRUrDok2c
	wR+VU9wuAeVi/jX4G1lPbR644PXLS0odKQOIt+HDbxYbJvrI65UTWrwb
X-Gm-Gg: AfdE7ckx60j7gXm6ASXAvJvrHFW0fUElKXSrxixezCqmOyffXzUr54y0fEsA/TMUgej
	MkZS8OFmxATW9n997pAMf7qamrzZM7PpIj4bilpnpSIIs6W0zc7U25ctGjeOjq5d6pjhTmCymiX
	P3H4ZZ9nME3ECDLYCEatyO6l3ioPfWjUOk+NG7DLixhEjKjJiWjqwxaRlL2s7X4cCttgh+CIkB+
	HyHnKOcyDPERNJ60ia+JGftkcCNOS0ecMT8Hqtfv4qfEkttqYsxvi58zAzMYAn52DpMy6qxOgrI
	/QwgW4TPpTkuYhu3LvdxDKqg2ogFRn+m+C0F0N+Li4DCaydTdUPYW6QKhB1mqB3pEmgqzv77ptt
	jHLyvFEYI41NnQ3OZUaeCwmAJcnTGgDymF9DbpsMPDq7WreWbNRyJeebt+fg4r8hxxXJQuvbb5R
	8tggIcKYpuWJ2+YW6YS0m2n0RgQPmh
X-Received: by 2002:a05:690c:998e:b0:80e:dc2:873b with SMTP id 00721157ae682-817424a4286mr66993537b3.16.1783247622061;
        Sun, 05 Jul 2026 03:33:42 -0700 (PDT)
Received: from crusty-box.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144ba2665dsm44421007b3.41.2026.07.05.03.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 03:33:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 05 Jul 2026 13:30:28 +0300
Subject: [PATCH v2 2/3] firmware: qcom: tzmem: disable SHM bridge for
 SM7125 platform
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-sm7125-samsung-v2-2-d3b17005ecb3@gmail.com>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
In-Reply-To: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
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
index 0635cbeacfc8..50f500834758 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -81,6 +81,7 @@ static const char *const qcom_tzmem_blacklist[] = {
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */
+	"qcom,sm7125", /* hang in rmtfs memory assignment */
 	"qcom,sm7150", /* reset in rmtfs memory assignment */
 	"qcom,sm8150", /* reset in rmtfs memory assignment */
 	NULL

-- 
2.55.0

