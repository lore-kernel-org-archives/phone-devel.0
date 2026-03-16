Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C947E3D1CC0
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681597; cv=none; b=Evp+h9tIug5I8VsLAsZEL+wDGlC1jv0CaBrtwpQcIMcJ4Zn6u7y6J9lwlLaDJpB8klIbnvU86R3jbYC7pG0RyltTGcsB7jmx/3EosUrDmGM6ALpb6lZmE45Sp2H5f/xeFUrUt2cD81ZiI3l7keNjp7GHOWrFMIEThwY+CS1rjS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681597; c=relaxed/simple;
	bh=fwyYVczkGGhNbbtuDw6wb0iPQK79Hav8hEBxFnyoihs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWj1WWvzlNZWWSPBNqb1WgLaH9fMYh4sEBJ4OpNLRVYFD0aSv3L0ImKux8DR/cHCNrEMClEoOnecxti/1uOFSLmjuQxinyLBjfdzn52qvFYNaokOnbG9BDfmF1HYliS2ElPZOQKQ+xuoMgStP4do8+ZK3BxAk35fGJsFaVPeR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4jO7IqV; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4jO7IqV"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so6884485a12.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773681594; x=1774286394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5lDxPgHMLUWf4KOAgcF/BaGDb9kL4QT6S8GOy/ie+w=;
        b=l4jO7IqVxgcgLUJJZSXH+fqmT1n1VQSP3xwRcXDBMj0sVhNGdUL6jHWoaUjETIDdaM
         uGQzxXGnitAcjqy71ublk7gqpi+vbU0KEYBKxcYRD7qkhdcX6MQ1kdqHRsJQLhRLL4Nt
         Ulo2YYNjFnxDkEcR+BNVnEhQZrhQLpURiaDuITnb4OgDi1/8V0miq814s013JPr3NHPE
         xlFYb0RpcFbOWyt9lVwfnvkC5pl3lXsAQ+mMlAP9yN7jcQuPaOhxeY55dRwMLNYa1g1b
         43pzma+5Wz7FwVVSITsXn2eHqb9Tx/0Vt440c2sHQ7f9AwfASz7Nh7RKLiNv/WGjgsdW
         IIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681594; x=1774286394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5lDxPgHMLUWf4KOAgcF/BaGDb9kL4QT6S8GOy/ie+w=;
        b=XGkRdiqA/Z5gyXkkrsI3LimurK0Y6F/LRBB7M3ZZ9QKN28iLK/TrDDxATGNkHYkhv6
         TzAWAtW4ivfA+aTOEPt8x9Iil2+uAChq2Dmov0RbgbySTohmJf5eKcERRTXDIOY8vT7r
         k+46vVF4OBGwMpCErx8ER6ldin/2ecTTYTpFnn0lz4UPffs8coAmNHOOh+JY4ePtMXZJ
         vyXwwxUBtQcAkb+RORPftegOVHH1D5Sit3qAMSuN34oB4vTS+eSz4MaOtZ94IpDw1+Os
         2s0iT4i+bwrWe+QZYXqRBPRrEyFxLJm6/7usNJHcbdVlOzVyyGbC0Ibx/9pBVUCL4y2F
         1HvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmQ3+6h5sr93VFyiFqFTeUiK4m4oBS0OWqdnlrpmZ0aNc4+AlKa9RQXcC4d2CAIyaapfZvUX6Y5Awokg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIgLZRCN8Bk40aWe5trj616IRFZf3cLxxUVXVgS1LanVgEa9Xf
	YVzNoJxk7hq2xl0HJJff5O2hreKUNeHKjq2JjN3PVjSrKOOp/fQ0u/Wr
X-Gm-Gg: ATEYQzyHESHuvE/2Z4aEm3EMn+sGxksNscjY0qACI8k2e2kZCa4/GfGT5XYhW/Fzowp
	CkFgZDpDpoGWS0hPbJwGKwoK+y6KbV104tLuJHG9bItmP+zcSh8xkbIHyEGGeUUIdaLkR1pDl7c
	UvU8jtd4a52Uf+dQicVe2xtwozfUIHOp9ApboZLOCmpgbmA0uy5LdlHefFzmMQs9oVUngBsKMU+
	BxHyENjp7gb3tUg7KoXt5YoA/eHcTo1OtP1kau7T8lHWvRb48bF+eswxMScsaQqqlX7DrCPMMcS
	IIZaC8X/2DTuNgeVQt5xOQpzs4doTtk8ilRKPZOpt7Kd7Z62K96F5Ys5uk3WiBJVICd6sRg8l+m
	qLZS53NFInFjkIiF2+vbbth+hKsbXsf547+wjzJKqnZ9SqVRhF664yDllkymvwu5nI9xFdpXZVd
	frr5dwIISdim46ZgqplDOGfLYZQA==
X-Received: by 2002:a17:906:3396:b0:b97:464:956e with SMTP id a640c23a62f3a-b97651d0b0cmr575179866b.34.1773681594087;
        Mon, 16 Mar 2026 10:19:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97846174cfsm505940266b.22.2026.03.16.10.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:19:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 16 Mar 2026 19:19:47 +0200
Subject: [PATCH v4 3/7] iio: light: vcnl4000: move power enablement from
 init to probe
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-vcnl4000-regulators-v4-3-854fc2eaf54b@gmail.com>
References: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
In-Reply-To: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
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

Given both vcnl4000_init and vcnl4200_init end with
dev->chip_spec->set_power_state(), they can be called once from the
probe to enable the sensors. Move the set_power_state function from init
and call it after init function in probe.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 939ff2d65105..287ccd89cfb2 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -280,7 +280,7 @@ static int vcnl4000_init(struct vcnl4000_data *data)
 	data->rev = ret & 0xf;
 	data->al_scale = 250000;
 
-	return data->chip_spec->set_power_state(data, true);
+	return 0;
 };
 
 static ssize_t vcnl4000_write_als_enable(struct vcnl4000_data *data, bool en)
@@ -425,10 +425,6 @@ static int vcnl4200_init(struct vcnl4000_data *data)
 	if (ret < 0)
 		return ret;
 
-	ret = data->chip_spec->set_power_state(data, true);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 };
 
@@ -2003,6 +1999,10 @@ static int vcnl4000_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = data->chip_spec->set_power_state(data, true);
+	if (ret)
+		return ret;
+
 	dev_dbg(&client->dev, "%s Ambient light/proximity sensor, Rev: %02x\n",
 		data->chip_spec->prod, data->rev);
 

-- 
2.53.0

