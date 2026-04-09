Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F739E6F8
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722420; cv=none; b=WCN5A28mWhmFotGleLwSZsm0zlnu1EjOvvYjMm3JejnKdUA0bvCQcJo0OlvTCzUFZfa8lxVAPJcNy9vYKZLaubK+QKfqCWqkE0fwchF/LPVimuvBhZsgDOivvqauWZUXF5QTiJkAlqHe/VI0vIr/ZbZzmxyvXn6pQx2ILkhxY5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722420; c=relaxed/simple;
	bh=zVpeYCI0Fp2z5aqjv7cM/PPua39ANpiE2GE9IcuZhfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRrK29S+apnXuObYJnd1XB+IZnzSFq0YMPrOvpbYPeimPsc5pw3ImVbEezxaeridGcGXqBJvnnuehe6lIsS35WMoI8z3U3hqIE54ru6kYG6GEYPN/jSP7yZMA1kQlNYFjfvJd9TvSOZ52wZ0siJJbI2LKd95u0FWqvSJ4+cz8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ai5YDOxS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ai5YDOxS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so81687466b.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 01:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775722417; x=1776327217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLl5gC/5dARZUSktr9tifAs18EiDAxNQou2h9Hd7lWo=;
        b=ai5YDOxSESAibjjoqzj6vwacxgrGcmaoMS+m6WTTP3fBMt1V6SUwKsX/VYPRX1DSgh
         klERBGmCt7CbrW31GnumjfHp7x289kiwrHAl2k/gBu3ZcTpGXpN48gp3kOElQ4KmuGmD
         S2s66IQ+3qNSUD33WG4dX6VX9vfpDy3YfnM1gfxN62mprd5JL7jKLLGmYnFpyVKhNIun
         fuC2e69sFBUxBCERLQ0btgVfSyWlPin+SC+X8IWDqd2HeRjC+B5JCwiEhDQta3WQ2zlI
         Te2KgpXWb+AvY3Fu01ytcrHqxPiiTZiyhuaGbf3HdcfM8Q9pFxKCYXstMDI60kGj+O5Z
         1yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722417; x=1776327217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLl5gC/5dARZUSktr9tifAs18EiDAxNQou2h9Hd7lWo=;
        b=Ewy95obaNX9bevj/yEjNvGub2BX8RF/nuER614RRCVBfHxQ/E2P8OAm7dZK90e3YX+
         d9FcHO73Cy5kWM59bvGS7eBEfgJdAzRDSrK9vfuLr0ucwartZnU98EwRzNnvmoy4C/wN
         1KubhowxOaUJ/2WQVoGtfjNMYWzKMdNCrXdy1Cj7QpK/uTwcfJXEYnCZM6dvCd0qsWr/
         bgrSjsMiG+ZgTLezTYUi9wfXEYs6Y1Ek0yDlXGMeXdjIILI9HtpFZyQxKUfOstLhtFDA
         xKB9D6yWWP/kekQsAELoDg7/JtcN5rcttRTda4eIoXZg1EU+kXeMw3WgMa67mX6B10tW
         BP7A==
X-Forwarded-Encrypted: i=1; AJvYcCWmuyLFiECcPag1D3zEAQK0xj3+jnrCne5WDCPDj3tEDngW4FtRJQ6jpkHciNJVHzIKgr7r/K9d9uJF9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCDMCPpDjlrFg66/tgOItMT1it81SmYmniOQhB7gac7BjD5Y1K
	zT7NPOv2Dle3D4ec5lQcH14typRSvJC+q+nfcgGnEngPEb8h1opkIPgX4KNehC47mpM=
X-Gm-Gg: AeBDiev85y7psbL+WaTLWrr8dyDWTsQCM1DqvPWZ8GVbv8Z8l8dxx2jv7E+0eB+9jUR
	RfuvOmn4BrHg/6M7PR7y5lM4kCkL/5uzB7fBPIr1bTOOJRTv05Dsejq9ti2doxPsh6ZGshSRjgK
	CTJkbtZfYoT66Er+ianEGQbacdFIem24u+LFhdcEfPyWkT04UrrbFci1ikW7m5sBBXJ5zKJJ6HW
	6JhUT3ZQYkxkWE9f7lkMTGgNOgJQB85wYJEcuSONWRXWl2Kti7fC/sj/gZYRIUBQHfL7OndDZSh
	XUhqGBKFJPICEkWQ4/P1vTaUOSF7hB7fUGxL4K/JSGzewh+BSlTe+5JbKOtqwIO+EbkKiDdXFC4
	pkwd5fbdeDcbZNIVq/fDgIwqSCqXmufD6OICvw8xuNtRETatnLGJ8tAkprqgMO4IwuRMZwOGlBW
	uBnrtfC7R9E+Zee8MCMqctC7tKEE2R8qr2A1UFJ7WSQZuiN9D7J5iYtBS+flPKlg4LAJdd4kd3/
	xN3KKO/e5oFGB4Z
X-Received: by 2002:a17:907:2d9f:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9cb3b5bc8fmr892722766b.6.1775722416882;
        Thu, 09 Apr 2026 01:13:36 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f20sm709846066b.38.2026.04.09.01.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:13:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Apr 2026 10:13:32 +0200
Subject: [PATCH net 2/2] net: ipa: Fix decoding EV_PER_EE for IPA v5.0+
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ipa-fixes-v1-2-a817c30678ac@fairphone.com>
References: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
In-Reply-To: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775722413; l=1045;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=zVpeYCI0Fp2z5aqjv7cM/PPua39ANpiE2GE9IcuZhfs=;
 b=CHEi445KZvoC0I15KF5hTJRWv53wWRXSGHOTpa7orG3qMHl0QrFrlARJUij2VbYkde8+d0wyF
 KqVSQMVHMVbCXXj8FH5xKxVlPcmaajmNdmK1qmTVgdje8Gkloqxakwv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Initially 'reg' and 'val' are assigned from HW_PARAM_2.

But since IPA v5.0+ takes EV_PER_EE from HW_PARAM_4 (instead of
NUM_EV_PER_EE from HW_PARAM_2), we not only need to re-assign 'reg' but
also read the register value of that register into 'val' so that
reg_decode() works on the correct value.

Fixes: f651334e1ef5 ("net: ipa: add HW_PARAM_4 GSI register")
Link: https://sashiko.dev/#/patchset/20260403-milos-ipa-v1-0-01e9e4e03d3e%40fairphone.com?part=2
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/gsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 4c3227e77898..624649484d62 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -2044,6 +2044,7 @@ static int gsi_ring_setup(struct gsi *gsi)
 		count = reg_decode(reg, NUM_EV_PER_EE, val);
 	} else {
 		reg = gsi_reg(gsi, HW_PARAM_4);
+		val = ioread32(gsi->virt + reg_offset(reg));
 		count = reg_decode(reg, EV_PER_EE, val);
 	}
 	if (!count) {

-- 
2.53.0

