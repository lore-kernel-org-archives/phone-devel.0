Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528112;
	b=AwQ/qJ6uLi/VYCD7NceKWSXA9FaMqFgaTutzL09LuNl11Vxw6qv51YhssbQ2++vTwomW
	 x3rEtbRLmxYixO11CB9LwnzHIRhqmjbvu1MF8rGeZJptvNgREMrkQHX+5NAohlnOcwoWQ
	 wHLShzw37WXvGN0Eugd7wdep5Jj8xHaoxL/fLCmwA6O5q50B3WvQYvL1kUPoKx9PdI0VF
	 lX1Iy6s2ghfKE0Rk5PjxyGuz/Sh9GSxqVUV+OH1846cCnHOJO+3vLw5xEsIvu5x+jkLHX
	 yx3Oxz2bYztrWvxJQm4dOjzLIPShHilyXWt1Gk3ogakEOesG6e21kRWHKBX2K5Ak6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
	b=YXO4MlGY7oOiRmPSTvxyGSdKtdRyoInAxFg6zMIcu/TNUAL+1lhgFKwTnaNEVVMlYi82
	 RDQY0T56SvpXZ/Yoell4mafkNlba8bJQYLqWtbnRILt6Sn2A22zBze7jzrS5BSOBY7ky9
	 xI1SwLUgnthyzqhtvanyTA8ysydbS3mlUwK4BBpmkcSjDXPljxGOSBuB9rny/bR1xrpw+
	 HDe0UOxdqERrYD2ecI9GYkOwwfAIC+4oPFW6HYWd2f9bZxFH6QuFfupN/Es86O6Pbt6ZF
	 WuLAq5NbdMqcMaCEtit4pp+VtzCcnoRDhQPAGduWP6qPD4SNxwYeTaeqbTYNyYJJ7xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AWU0KiMC;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CADD606A31A
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 20:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CADD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AWU0KiMC
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso701166e87.3
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528110; x=1793132910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=AWU0KiMCQabspfqJkK9CfxUvhC0CCjGRLp7SAqZU6Rc6n5torA6hasvYpWaTV2N3ji
         Jw0FYcG2XXVhTr+R8zjSN8ITdr9miql1hKSRtulhsSD5yOJHtwUPEUokoMiJoZEbPaXF
         9dvaVfjIdr705QrfFXguCgF/8R1xzSnxYnJ3ppeIBDMenoU0rzOASd6YmepZFqbXjfRI
         fVcyHLXCVnUDW31COcZk3S2+Ek+9jH10GqvZKz5mPCBdMsPVNLMMKelgmxwOCPJbcVgS
         ZI7zFmtYew2OObafY/IKGvIlvM4FHVXbnQma71ENcRmeYEfC+naiMqtrfsUxdKifnGsc
         9smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528110; x=1793132910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=RqPenocyJNZJHbONBBwk7NuFMHD4NEnUP3yWKFMdiatautUqiVkEwq37f7wpJGOIKG
         T/YWnfSu/gPuZdA2YCLVGufm6AsB2WF+YPJbzuoa2nNih151jQ1QdYXdm8O21rgckc0E
         b7mZyEQwBYmy6V7pOtMwLjdRaT4u0bgNzIk/oLjXEib1LL5O7oZJZLC4rUNHfY39GbPp
         9dHOzjg+K6eh6ZxZSvVW8jfNT8Mrvs5JAHXjabRNKT5YGmL1Af7x3pwd/M/Pg4zkpQcM
         oDODKxvdeXEwu9s3Dg7rqs8za0i/EY+dJ1/NeqD1tuJ10lKd0zY/H21hviyzs0VSgfCJ
         EYVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnR+LkKkdWMK1fAzXJnjIbXmTmwor/IWZ3D8r/uvd1sUwC8tEz0fQLF3h/xxCRNmke17o7xmr1NCPrOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+mlzIThcc0sKe0CnFlv8EoK7gJvlGy9Q6ScPBxOmx/D7ZU3pC
	htt7wHFXexKIE+e7zOyluLijZPG8QEGugLkZyVBTgQjzp2M1TBat6fPB33U3o/tA
X-Gm-Gg: AYBFou3iC2drvfRBbwhi6IfVhAZUoNhrY51EJmFsTy+e6DnV62/3PrPl435hsYCQRie
	Ty+3BcAnxj21KU9PrF/2oMAcLJ7Lml7Xkgxk0oyt6qJNzt+8nSV2XMLyR5cf97rVU2PEg9XPCJh
	gEfKYveTszQQLxL1YOsLlvxfbiHPB1RpwSKWC7M8R5gu64IYOcj5mjcdLKblohCdsJPrBO1hskN
	000FMVvWTqLs5D2t4uXDD7PBm/e9thjSmbb3Z0IDDIMYINVBN0uDmrhlGFVcvdOqDyBQSXl3+w9
	iP36UdCVf3advGdrKJwDFmK4G86uvjk/BWNTD07vfGIxTKlbvtrVVasosHclyVxpIrKbjLsKG7D
	G8lD/c8m7H5wNAvDwqhkyHJSGyp/7tnYQPKPQ+KuHFSQRNeKiRxVkE/UaEWn6RJkqwUEXjVT36E
	vLk483WO2Q1V+R4Bdt/oD4LleuKlZp3l6F4k/flMBIkdojqlz0G4J15nxuu9GME6aC/yMhII8Xq
	bqXdZq7g+ryl4Xg1gLoN7oSOwVu7Sg9y3fHdRXkDvlWl9ZcBivsC+ITYFl7QADFtwPURhQaEHGj
	jy1nOEalnhIiymx0QlICsEFYXHRLqHkZTh3GjPCqQE9oVg7ngZruVd2jkIoWN+L61SJ7V24t18V
	eEQ==
X-Received: by 2002:a05:6512:1589:b0:5be:680d:6e18 with SMTP id 2adb3069b0e04-5bfa1be6184mr25360e87.10.1792528109517;
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1230c48sm88136e87.66.2026.10.20.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 23:28:25 +0300
Message-ID: <20261020202825.1178464-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020195021.1133728-1-gabin278@gmail.com>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz> <20261020195021.1133728-1-gabin278@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 22:50:20 +0300, Andrey Derkach wrote:
> Throughput is the same as with the old version, about
> 60 Mbit/s here.

The 60 Mbit/s was a board data problem on my side, unrelated to this
patch. With the right board data the link runs at VHT-MCS 9, which
exercises the patch much more: during a 120 s TCP download at
172 Mbit/s the firmware split an A-MSDU 211 times in 62,700 in-order
indications. The patch resumed all 211, with no warning and no
recovery.

My Tested-by above stands.
