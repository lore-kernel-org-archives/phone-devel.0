Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7575C32B99B
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 20:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756403; cv=none; b=uVVnZUFZQS2MbfcyDgBUjA7DjISfOy9P3smuBZ13/PfpjNQndBMcfkylb2KsL3fmRHrFVnOh3GPqP8lVOLJBw5YEtS5o5Ords1id4KknW3NmrGDjHbZ1JwvRRuvyC84+876QlMH0VRLaj7WdldnKlgWGNs1FVefUdVW91hjLI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756403; c=relaxed/simple;
	bh=tsO/mYFaEUMvZc2LAc3OA4nmB8LFQ/GJH7pow3bd52A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iYtzs4xX+TJ+vzEUuaX1PE7aPDhsuGk5f8UJ3JJ5FZsvvOrhR9qtLAOLX5j+692TlxPE4AimrV4iDDyqKOiiO2+RiM+ktsNof23xbcguH3mDovrHwrm+lqBH3abvo5OHLvSLYQ0fMIdnVeZejxt+dUiZeiN14ENy+IcGv5o13So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7WUl8oV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7WUl8oV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806bf39419so1351365e9.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 12:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770756401; x=1771361201; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMGv2vQvKQYUADdNnCmAW/VA3ahvinln9Fwhr3ZpQZ0=;
        b=a7WUl8oV5jjPJ9+PoeXKjCw1fby6IUc8JoUGNUEKBVnRhDDLH8gPKC5SI+VUFYovEz
         Cp3GSsasX+MbKoqjs3o9Kilus4StV0gUs0KnQmQE4tAe50aPfEf17niTqXsGT4V5qUUn
         bPlAPsdwnJQusezDm99XtQxtR6asF07gLwaq9kHlcKNo0YUp54HH3qetrN08z0NnXHYZ
         GgJ0zJCvmxLTIKX8PCCcpN4I5PhTbc1ykJUooB9aQXy5JV5CTaj6U+aHnNIdi6whr1Yj
         dJXFif+1aRIJsIp19Y//jNEnclnn1HpPu33nBhVP2skw2BbpKEBO/XXrORqBBcKknfeU
         IRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770756401; x=1771361201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMGv2vQvKQYUADdNnCmAW/VA3ahvinln9Fwhr3ZpQZ0=;
        b=TIh/W3NXqD+eCVw2GEK3jBi+q6Lcs/79yfzqBYa/WETrvW7irEHz+8az8u+fHOi48v
         B92WgbvudrJECVeziEWsYIlmnJhjlVdIf8CRKjSWIgWXDUqJdgy+MFuj402+ZgoybUs2
         +n0cmzjule19ObHl9BeTDLoO+LLM8tzp0Y/WfuuXaQ8sRXV0/UQcj+gS65ALPftZPzXA
         evZT4+6bAMl3n+v7OVjKVL0hRBMX6O/p6GrjXDyJDfBGwC3gdEcwA7xZJGKqN9ZXqsBr
         u6Bi/FhA+EneYgli5RA550kN0J3RsiKRnYeycrau1QwcmZg3m3yEmpkI6n3pfRsN3VoK
         aiaw==
X-Forwarded-Encrypted: i=1; AJvYcCXnjeYbwaU0geTSLaEs9ZTIVoyILICrJg0G4BIcXHH+VargV8FTncizNYwaLAohYdz13zP9HbfsNXomVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/v+mI0dEicW2b1kZPkJr+ZJQ9Vn9N0dK9uXcUCDFeiMS8TiD5
	xxxk/qs6WAaF0jZQroDFx0SpbNwkpXgXodaHBGBqfhDn1GxH9tIdhV7x5Rvkmg==
X-Gm-Gg: AZuq6aL3hIa7i2qLrW8wTFyQmI00dXX++jrCM1rIILrjRZM+UCuCNIeGbD/Fc2D2cqx
	dDF8ZgwgGknKuI1m4InUyOk3s2cQ74slxMiSEFY5VWYaJf7vckzXesjpCshPXHvj2pEDzVXTE7u
	SdwDvHTU7a7lyo8rVvnTi/Ehi/U19nJX21VVBZfGpY77ZjNW2HQtq4S07yjJMyUozYza2EpeTOf
	u9J/u43sENKQwUSyqnIyQdx1jjv9JMKkCgOtOXqhHR7QGtFK+jYboFR+m6is7ZSdx1v364dypcf
	wXAaqsW6TCetGWNyhf65Ibpe3F7GMwScWcKSNtWUt3n7b36vqlSzdeZHIirz/BkEi/Svv3uu4ym
	BJM0WngCYFlgSKH61PYvpoOgyVMIpexRv56iIQGbvO2zh/ym7VQ114qe05clUJE2+2zr6Oit2y1
	YuKTF8lFDZ6Mo2bVldXLO3jlABbg==
X-Received: by 2002:a05:600c:3b8b:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-48350511771mr58266075e9.5.1770756400685;
        Tue, 10 Feb 2026 12:46:40 -0800 (PST)
Received: from [192.168.8.10] ([2a00:f502:160:28bc:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7d6f3esm71451965e9.9.2026.02.10.12.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 12:46:40 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] iio: light: vcnl4000: Add support for Capella CM36686
 and CM36672P
Date: Tue, 10 Feb 2026 22:46:09 +0200
Message-Id: <20260210-cm36686-v1-0-aef68dd46ad4@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MD3eRcYzMzCzNdkxRjI4skC/MksxQjJaDqgqLUtMwKsEnRsbW1AOy
 VWSpZAAAA
X-Change-ID: 20260210-cm36686-4d328b87b6d2
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

Capella CM36686 is a combined ambient light and proximity sensor
developed by Capella Microsystems, now a subsidiary of Vishay
Intertechnology Inc. It is fully compatible with Vishay VCNL4040 and its
driver can be used for Capella CM36686.

Capella CM36672P is a proximity sensor which is fully compatible with
CM36686, and in turn, with VCNL4040.

This patch series adds compatibles for cm36686 and cm36672p, as well as
disables the light channel for cm36672p.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: iio: light: vcnl4000: add Capella CM36686 and CM36672P
      iio: light: vcnl4000: add support for Capella CM36686 and CM36672P

 .../bindings/iio/light/vishay,vcnl4000.yaml        | 17 +++++----
 drivers/iio/light/vcnl4000.c                       | 40 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 6 deletions(-)
---
base-commit: 132737e360b4c0daa7f473faf0f55cb04ee3e15c
change-id: 20260210-cm36686-4d328b87b6d2

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>

