Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0333554E
	for <phone-devel@vger.kernel.org>; Tue,  4 Nov 2025 14:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268315; cv=none; b=ohwYeMeWNxXzXpPR3NfgCF2S7J5q435udt3plVzGVxvkAQz1eidcmBwGCLlcctG8IuiRqh5nV35DQn2YCmceqBi3lnjEbKSneVjOB1jV0CU+MZstpZ9JoDW0759fxKajDoTIORdf13RJR0M3CnPOO4+QQHoFGs70X+c+DEsv9rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268315; c=relaxed/simple;
	bh=3S3vLJQnHmvWilF8Wd90CB2vFImWZrThbfrv7SlfrKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdF22hzhB8LRJPe8y31tydluhJzBNtS9jcNYzu1Y8hwwiOScHp5llLL2PQocApgC8eSVr8M346CUbAn9yyRFxnPKsmqz2abCdDs187QRRZiOIA3wOxP5R2nHXLu//GBX/Y3X3QUAraUznp5y5A/Ux/qKVFFqK1qmCDIRSe+UOfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViyCtEUl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViyCtEUl"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b64cdbb949cso987905566b.1
        for <phone-devel@vger.kernel.org>; Tue, 04 Nov 2025 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268312; x=1762873112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO+PI+vctgydxy3u8Ax9wXF6KiNkHmEcDhtdnRtl9xw=;
        b=ViyCtEUlI+YHMmqLGMp7Gl2BnevI3Vm8IPWAfvFj2wsWNr/SP6lXX8tUoItE990eJ9
         SKJI5SSP0WRhHBCkZsISjqsKHWND6m/Dwxg3Q929SVjXBtJKwcWHTdhDVyjlK1vqwgsV
         Q5QWz3zARpTM3T+GD3aFc+er/BEZN466dN4uLfm2JVTZWZnwvRE8D5/+A2WIRFCJunE+
         jDQmLcd3TXrCld4i/U+6umQEMSobBlHmVsdjGx0AoP469XTw1JXtIdx3lWwU91CZwY7P
         RK3FY+fV/U+cpR6Ps1YjYmU4AUw1piSHP22p91jV1ki4z60CcI41EUGXrSCWHt8TRL3F
         2p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268312; x=1762873112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO+PI+vctgydxy3u8Ax9wXF6KiNkHmEcDhtdnRtl9xw=;
        b=i/BLXJ627LfrzNEVb9peMVps+8dnWvz+SOymjVAZKoF+7HvoQclh9S1khj0VK6jn+U
         3QpboanFu79nORwRBSyqasFGH+S816SSL+NLN9RIvfrGA9ijmTc3wq2rB4JSusJO9SI9
         4Tee9ERPrtbv5RsOqcrQfrj7VZ9ZyspnX4VksEH0FXpz04r4T/iZJPsg8JHvsYXYN5sk
         qWSq+AZW0YqKXoUKOt4pnOA/3fgZARFJlAcKbEEf4hoY/I7tatr7sMA58Om8QxF+PQE6
         I5ay5ycpgbuGw0nFy37ZrLq91QLfdout167kUbnLQdie1wjzyHqTvOFs9ABpjJS6Aplm
         Np1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBfCLaRTthNuBFqFOA7VVQtXXW70oleVa1JVgxd9HRLvK0ReeW9RN8pksUaYcYYDmGtEXHl4m6N9My1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YysmixBMNMwyvCVRU2SClYBB2tj6z9TFajNgafhYUX0TqyBcITt
	sfICWLj1kdPr4wCA0LJ9WDyP7EFzc+KoRZ6Fg3viZ2aDaWhLVEyQAWET
X-Gm-Gg: ASbGncu5bdtEJfzwr48CEKfcUqHo869KSdGkW254SnsuXupNaP93AgBk6oxARXeSWuG
	wGxUuSlmEB5JX7Pv9b7gNHpWKnu9be0SJsEdIen3VApoxygssdvEYKyj130q6qNuqOnG8UlVJvN
	ZpB9GTGNhH8OXqBDvNa39MnRgMyjb7/vIOyVwqGjy/kf/NIXuSk89jZf2eq+HF9bzOLzow3PFGp
	Txc7ZzcvInajFi+C7a5cLfFFXDJnENsoYZdZSeuT8ks0TvEsadTfkpWDA1UGO0n0GBEPvcWPnJU
	eUzYfowArkS7hyl0w3wIvVxcwhYVXBiaHmEsKnX/6K8pOQUX3HI9svSMLbXqJIhDs3onmepiuxe
	piYSa517s6N3auIU4bFDunXp1EARx52Y5H14T/ivcbL3A1P/ILhd+M8A1yEwDH62TVF1itfs/cO
	N8PAjFPM+qfwAGa92XNVqF5IzPjpWTWe0ncjVNpHdC7rbISOg=
X-Google-Smtp-Source: AGHT+IHQM+ae/PtrcBYu/XEl+3c6meEt5NSkTaNxXmye33gFO7J/8CNzTF6Yj9O7hl9jP+R+gadKLQ==
X-Received: by 2002:a17:907:3d52:b0:b3b:4e6:46e6 with SMTP id a640c23a62f3a-b70700baa25mr1718403766b.1.1762268311405;
        Tue, 04 Nov 2025 06:58:31 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:31 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:22 +0100
Subject: [PATCH RESEND v7 4/7] clk: bcm: kona: Make kona_peri_clk_ops const
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-4-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=3S3vLJQnHmvWilF8Wd90CB2vFImWZrThbfrv7SlfrKc=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSORxgQzf/ZL/gp2Ma8qyDv3uCNpyjt/zNPv
 EmKyvUGI4mJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjgAKCRCzu/ihE6BR
 aJ5zD/sHarUnmHEx9mOpGgkQj6JThv5bsoxJTyL7m9Lh425mb077Jhlo6Z/tsFSTtFt4iU6rRJd
 oZkGeqMN3R0V105KQrHLJU64qMwduP1y56Sj+Pw6GFRM+KEp6vGieizMW7Xx4iED3eIiRwhk7u6
 Q81J2e+mc3RJdm6uan1Zs7xq/4zZ3Svq+pnRbVRiBMVMKzMgEK7RfrxJctPIleJE2t7aFRrl/US
 zPEo+FghW5tLw/2lj4CQ71XlyMIo9ZcCDxvb4gH6qD542pBLb/omA275yOiyEYe/ORBY4i3WhLd
 G92AWkVJXxZ1E2/FCj7gu0l3NhfHEx4GO2k8dJu43Q/UkjGHfveQ9TcpJbIaOTRlPTBScfEKuFB
 bzslyURLmIOcK9/sjyQlVJgwj5StXbiqnJls/XI67aV43aPeC3VUTUzb9VRSQWvIh7dsu4faY5T
 3zgR+C8jVP8kUl4HY/mbCdRKFR5iEDeYIfe8+Migw3tVHBwQJ5L/hx5mQhv0Vm2sn5sy3KbOzyq
 xv4ghk6kB6IzmsiG8rJBpJpD/ZPWsBBwdq0g2u4sKc0tJsWP2CrhaO23jX8oUMSoPtpaDWhVaP6
 aSm01IaRqIYoscGsb3zk7Aqf4U7nPCO+YULFMQEdaxVa3i0peasQR3HVNbOORb01qog9otfXX3r
 IOsVFFcJT5jIelg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Fix a warning raised by checkpatch about non-const clk_ops by making the
relevant struct const.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Add this commit
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 drivers/clk/bcm/clk-kona.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index 0171e6b2bfca..2641eaa4ca52 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1154,7 +1154,7 @@ static int kona_peri_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-struct clk_ops kona_peri_clk_ops = {
+const struct clk_ops kona_peri_clk_ops = {
 	.enable = kona_peri_clk_enable,
 	.disable = kona_peri_clk_disable,
 	.is_enabled = kona_peri_clk_is_enabled,
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index d7cae437333c..7064ce316981 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -487,7 +487,7 @@ struct ccu_data {
 
 /* Exported globals */
 
-extern struct clk_ops kona_peri_clk_ops;
+extern const struct clk_ops kona_peri_clk_ops;
 
 /* Externally visible functions */
 

-- 
2.51.1

