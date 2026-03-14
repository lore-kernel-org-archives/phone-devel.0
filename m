Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF58376484
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504402; cv=none; b=DB6kIjFACpPwJ5cYfVt+/jwEsd1nPT66Q48ElLBR54eKcadI1cDbSmTfk3hZOE7Z6cVZP6tfw81jiI9A6BsztT1BzDjKE5TfIAweOUT+fSqrIKKOj6NxgXTT3LrSJraE4dIwrfnxOAcd6j1dXkS/rczzjFlG5+T7HPdk+pHnbRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504402; c=relaxed/simple;
	bh=yU/EQoZ1q596/CHvlN7YkhPccRT6mfDqWPXqpjdWn3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnbN9vUrFjjbbosGtDrtIxL3dSEcgtZ/CaYPciCl2DEezHEoa41gtzohQV1qGH2fs2CK2/C2/I6V+Zu13QncRu6YrXmtCiOMba3P66LQdSY3jcD06OvCyFTLuZFx5NOguc+NbweyXQcUU7efoGorBcYbOO5C/zBE/Ofdi62H95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InXjng05; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InXjng05"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6611e4aefdcso5101414a12.3
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773504400; x=1774109200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfIqfSEipe7Ni8DeiT4tR7mdwm129F2XmqEhRhL601Q=;
        b=InXjng0533pGZC0bIiIint9lnnbG1fMbU1aF903clZ1IZtJLoHiVnlpsnTD6K9OShJ
         MurP1C4iTWA0fH9V62ufxriT2ZXUia4Np18Y+kFI1crWlflGO5xcHjoQr4HH6z4NCjBO
         VWj6TVhJczYETTy2zn92ZQdU2lHwpPgKzw5mmIS3bP7cqOYjTR6Rg0Aa7ywBmBhaZFiq
         xVO7wXdcR4gYC1tx6sajqCubD9I9u/9VG9+9rvWXaCsmpR4uamyxdnN/dOwvn3uYDnK4
         q+1tF/QD33bwvBV/hlbk2Qn2Y5sLrZYS9Wpa9HHng1uca5I3x3TSP7JGMqin0kjka0pv
         MRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504400; x=1774109200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfIqfSEipe7Ni8DeiT4tR7mdwm129F2XmqEhRhL601Q=;
        b=O02wxZlJWNi8GfeN7Fn5wUhm4oNF5nHMBiY/kPTFDlHQu7/r7NgoUqTOKGwBQxiUEv
         gZj9DQvTDIa0pytnOdl9nvnNeRX/vLLyXesZfabvoVwLXkwOEoJrtb/m0vjj1djRpHzC
         2b4bBIEhn00hINJAfXku3GdIl7bT3Qp6uUVvrvmqQdamyzvcd3NKwIZs7CRRpiXbPbaV
         HsXI0bQkl68x+QMAt2TWkWbUiUSFJRJ1aLaYpI4hoowr+BOYT1CnUMd/Tqm729OmwiW2
         f1AOhSQxb1cYDCuXesBNN2km3yeGxXzt4Qch4eY+v3vr1aDOVxHrP79QDVQlBeD4fqXT
         8DGA==
X-Forwarded-Encrypted: i=1; AJvYcCWNss1N46P7wJVDnFaet1yP2CbqXZqy4qqDZbf1N7x0UGghHWOoLGfaoYyQ5LUolrsx4aU3laUwem0hJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfZcF3iCBT2SfToHlniE0wPnFaEFcCTPAojqvWc2I2azj/Rqn
	7QI+OvTiLPyRatWPhOu3rYlmwhDc16f6CWamvF2Gj9l4L9VR2CDDXddN
X-Gm-Gg: ATEYQzwBQZ+1x3UXxO9LLz91MEUhsp3TCrwH+y7rbRQ6nFm/nU8sFZDQsQWvBG1QOoT
	6fSasHH5kUWb+Alt9lsB/1f+aRW2Bi5Vsp/Cl6kGcaRnKTcKSOsFaiof4CWmfalQumGlRuTcFxR
	2JF0sT9JbexoutJqfvNDYKHR1tmF6ry0r+YjDNt4YtAveW3pZo08NfkcMba4PAE0n3x5l3uTIc3
	DFw6jmG75JLWEgHOGGGc2sqfv8r+jm9CEuRoNOyIPFi0N/lSmhumy/csUfkE5uniAzrp1rGXz90
	TbR8Wuh+tV4CjNeZjfJTvq/poJn/AX/uWeXn7spDlLlMd2sKj5ojavXeTdqR64fxWW59ru7yANi
	ny8fNp1CyhaI+Noxp+AKEO0erTuf93lqcPcZyVly4cpI3o6b6YRtPIMHdc67uqggjQfXZRtDgWq
	dQZw4prr7WLxZveikHGlDbqOzUgA==
X-Received: by 2002:a17:907:7253:b0:b97:554:f100 with SMTP id a640c23a62f3a-b97650f31c6mr423401666b.20.1773504399716;
        Sat, 14 Mar 2026 09:06:39 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm151722366b.52.2026.03.14.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:06:39 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 14 Mar 2026 18:06:31 +0200
Subject: [PATCH v3 2/6] iio: light: vcnl4000: sort includes by their name
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-vcnl4000-regulators-v3-2-3c4a48d30676@gmail.com>
References: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
In-Reply-To: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

Sort include headers by file name for better readability.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 5e03c3d8874b..939ff2d65105 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -18,12 +18,12 @@
  */
 
 #include <linux/bitfield.h>
-#include <linux/module.h>
-#include <linux/i2c.h>
-#include <linux/err.h>
 #include <linux/delay.h>
-#include <linux/pm_runtime.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/units.h>
 
 #include <linux/iio/buffer.h>

-- 
2.53.0

