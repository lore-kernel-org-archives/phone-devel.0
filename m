Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A539DBDF
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722419; cv=none; b=U8DfK+TUwOjazNBGBfXL6SWPOJJSQp8HZGTwD1AUJSb2ONnzGMNoGa07cLuIp8oRpwZ+tTdl30nx7GVzXjvGm4SMXOumn0Ld/HUrb4t1yphmW0CU+6u2sN1BX66ru63WJcwpLrwiLW6EnWapjLHl0URlpOht3sFjjATVCKR1J4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722419; c=relaxed/simple;
	bh=wamlg7cG4onOyAvlIExCjVjWIJuPxmnTcceFW3Erxjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Es67+LUQ6Ayfh5aqJqKdYy+fClG9ZLuyeOvR83GqZzR1XM7iIta8+AIU/r0Pc9kcDIa4IjlgyEVXzC6a7tY6eT+9NMgYvSd6+jl+FuKEAGCDHoAVW2t0i5+KRUlDJ60TIm8qrJpif2fOJWqPHEK6u6KOFE3O/uf/kQ/UnpRMc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cutfWxTf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cutfWxTf"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so99078566b.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775722416; x=1776327216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJTqTg29y4fyyCQIM/Qide/ZIGLKp0SbPQP2kYlNUwo=;
        b=cutfWxTfiQP1lUJE92zdljC1M49hCuOiMfT76lg7gUReZkQ3ZF0h+1T33TeftsJITd
         hVYbWKaFpvB+xD/S5NM1sZyVcHXkFd3B9xVnLxp3lXF0MmojPWjHYo68VidKT8vL2GRu
         0znqA1bgnvaaD5kh9u1+wUA+1PrjFa5Hbwwq668R3uRcLxOgDNq5VGLJfL9RLYWeB/Mi
         awpplN8dqPO/OdByS8E8f8IXSUsW5kD5JET6roJwPshM07iVF8Oe1qY4EpjWK4edH6xU
         nMb3Vij+7ofATzFXOI11EHicMyG2HHBbaFIEEoLD6SJlmbJSshtI6If9laZ/Qx8HtwtT
         1R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722416; x=1776327216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJTqTg29y4fyyCQIM/Qide/ZIGLKp0SbPQP2kYlNUwo=;
        b=leqOdLIeThoLUPwa1xImOOZHiw+Q8g+iF3BTT5h0abVcZB0xuh6dlDq7ndlWaZlatL
         pDZk0mVrCZ+qFazRJKgMJr/fAbjXTPxFK4d7qSHUvJwQwpBvCCw1uU37jvPQkJne43kq
         V6Y33FGUhaT9Yhl3phbHn2p+787CqmEx+hSbcEg+zixMAXuOnO0V0oUjYmjOEQuBrVUd
         cc7d/VT0iN3e1MMBm8D1bLVp/d89O5UfyIiLtrN+yQuN6MqlBlPdr29ouJH2BT8UZMrb
         VlOz1pcmdO76nVCOAJC5x95wfI5J0UDsxQ5Ba7k7gIXAWr+N63lZ7sw2GV+e7HxF5ubf
         0zwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx6tfwl1XWuTkPvWzi9JmfUlpobrm13fbWxG1XTcj/L1o6rA7tjMkA8QZldw7lkpvTxxMo6SaC1dmFJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+9s+nVbkTYCH4NTMk6a7uzqP7lB4I2oTyCgN3C3UFORaPBDV
	Q5PrSJny7/n4wlyipc+pZoeVqvrWCj6yv7YyM0G6WiiV27nWuvfR//VsZpLByFSr+gs=
X-Gm-Gg: AeBDiev9JdMYhcLVxCITkvQPwJDEJO6fD01DO5lZTDD1PfMH8gReRaxBR5/0UTg9XpN
	gwWFETL+JLKYiTAIg3+VJerIuXnALwHCiJGQW+/IGgRqtNexSOUZNg4HTbTQuJ8qezNyrrUUWaA
	YaqHw0z4AvrVU20d1P+TpOqyfkAsN3RkeqLENmg/rz3C1/Be+WYTOeSM+wnzGvs6ve1VDqDlwsJ
	sjoVUOGM3Xocax3I4ZNIw+vzYVc3RNzuWUj+3LmZSY7fgsKdT91ZsNZ3RZ04ixmMqBxzS0t8Wmk
	fyYBZJJ3XXRPjw4a3ckFkTPKUBskJ+e5PARfwBAQG0W5nlFIw/CZIHkDvevgtw26j20sLPbCiMZ
	J2KlwF/4tI5q+gcyUEEB+xk9LeBS79hp2KP44O77MA8bwV2Haf6eNK644+rmoJGkpQg34SIq1O+
	QRUYlhmsxcOmjnlQ5RUQt849g8ICXZb7tK3xBfUgomp3r7+wIMYTBnwio4zoQLzwlDRgDKzyQR9
	8XXeQ==
X-Received: by 2002:a17:907:3c85:b0:b98:286a:e2c2 with SMTP id a640c23a62f3a-b9d476ac76amr120880466b.38.1775722415821;
        Thu, 09 Apr 2026 01:13:35 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f20sm709846066b.38.2026.04.09.01.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:13:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 09 Apr 2026 10:13:31 +0200
Subject: [PATCH net 1/2] net: ipa: Fix programming of QTIME_TIMESTAMP_CFG
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ipa-fixes-v1-1-a817c30678ac@fairphone.com>
References: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
In-Reply-To: <20260409-ipa-fixes-v1-0-a817c30678ac@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775722413; l=1436;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wamlg7cG4onOyAvlIExCjVjWIJuPxmnTcceFW3Erxjk=;
 b=XZUulr8BhdYKcjjF8UzgaLp8pFwenn1sWPeLayNoINHm02FB77AyoV17swCL4CwNvDNSccWeg
 ea0YmdRC+XKDrAalkWmGOiQnYrsAI0HM7+Hk4KsUAtNMY6UyJ6Uq1q6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The 'val' variable gets overwritten multiple times, discarding previous
values. Looking at the git log shows these should be combined with |=
instead.

Fixes: 9265a4f0f0b4 ("net: ipa: define even more IPA register fields")
Link: https://sashiko.dev/#/patchset/20260403-milos-ipa-v1-0-01e9e4e03d3e%40fairphone.com?part=4
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/ipa/ipa_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index edead9c48d1f..216506eeef1f 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -361,7 +361,7 @@ static void ipa_qtime_config(struct ipa *ipa)
 {
 	const struct reg *reg;
 	u32 offset;
-	u32 val;
+	u32 val = 0;
 
 	/* Timer clock divider must be disabled when we change the rate */
 	reg = ipa_reg(ipa, TIMERS_XO_CLK_DIV_CFG);
@@ -374,8 +374,8 @@ static void ipa_qtime_config(struct ipa *ipa)
 		val |= reg_bit(reg, DPL_TIMESTAMP_SEL);
 	}
 	/* Configure tag and NAT Qtime timestamp resolution as well */
-	val = reg_encode(reg, TAG_TIMESTAMP_LSB, TAG_TIMESTAMP_SHIFT);
-	val = reg_encode(reg, NAT_TIMESTAMP_LSB, NAT_TIMESTAMP_SHIFT);
+	val |= reg_encode(reg, TAG_TIMESTAMP_LSB, TAG_TIMESTAMP_SHIFT);
+	val |= reg_encode(reg, NAT_TIMESTAMP_LSB, NAT_TIMESTAMP_SHIFT);
 
 	iowrite32(val, ipa->reg_virt + reg_offset(reg));
 

-- 
2.53.0

