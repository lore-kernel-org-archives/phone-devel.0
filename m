Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E1819ADA2
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685428; cv=none; b=pxLDqNR4HNEaumV3BK0FoGQNC2sPn2ljoIzTy8vvtRvtg1dKeTSp3nlsYYt4lyM+GLVHGbAzVJKNgetual2zE02OyHbXUogFd8LIhVnaEs/fTW3xeMparbrX6KN7YjzxXUqxGBsDyXkkus5+kZFvAjjV5SnQ5XS8s1xKPtUQTtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685428; c=relaxed/simple;
	bh=DbfIVgwdPOtjGyPYp3zFC8cSx0e4NRwlmaO+ILtD/1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NxsmIWEs3Z9lE09tIExKA6s3ELE8v/UFp/QUPOqy9UIRaY/ce0zWkV7hEq+GauJHJpAC7cDYQo5W1w01ytIyh0/RGvlRs6elQ8t1B3t+yee3p5VvpIY4PnNPLcCzVgCEvxCHmOzRvmHOaZsTNCvJujSdy4YpS48+wnkjEfzxRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vuWkiM2X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vuWkiM2X"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43623f0c574so11198945e9.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 01:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734685425; x=1735290225; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TKQF6v9mjJTHAGrz+anbwJhJc4N1fYhnSvoLIwg6Hw4=;
        b=vuWkiM2X2LurHfl3/g+Jj7uFleBh8ZZDzDqFryqzDp9kC5QIc8gZ2WbFhc/TTsyN5x
         IZs3kh9hl0UccvbDEYBOQlMdhXagX4bHcRRIIpbJXJTN7sFNvQdDSmtaXQhTOYRfeOOz
         M4ZKV9qzuxEcw3FGFo4lOazlVpYOIrfLPFZBui5clscZelSHKo2L/PXSSuIa1Qknaf6K
         UG5DwwVxu45S4zgKRNtr7m7EfpT5X8/rjvxsgFYATcKobrG2D+935LQAUH5+Adufgl6o
         OTEuaH51tfS6q5fjpO1mnZTTH6XBgcHK3oKjQB5mT4ylM/e6BD8ldfwIbiri9Qp7VUDh
         tE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685425; x=1735290225;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKQF6v9mjJTHAGrz+anbwJhJc4N1fYhnSvoLIwg6Hw4=;
        b=jEELKdIOp8tU76tAyaocJooPAzb59ly0aN981ujqQeeKjAq9Fux/VDCTEwuqA2Rs/z
         xPaj6yzo54Nr2flc2DAEFRmRV4H5YaUvGdGyJLSjjDDB/ppuevg9BNYPaCx/mdjgQe+E
         fq2t2knpblBjHCNOC1MJFmDQcCIJRzxJfg0IdDWjkhqQDMSwEr/Xy8b/W3hBR33bNbV8
         s0tUhgMEbz8H2pGYCl4eQgG1lqzzvf4WPfDGit+7zYQDx/6Wf2jL0pSicZbOlAgQKETc
         Ok92xi+OagOvxLwXgC/+HjYgNXS9wTfnYa0x+DPcwoyy0RiOwiTK2POtKIdU9e+0fX/l
         sLKg==
X-Forwarded-Encrypted: i=1; AJvYcCVp+LUgliHG58630/Vctvp7B2DXutypETuXJ41D/QJL37EvQ18sbgF/5U/zCnfWHe4hheXDeQqepOI4Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEN9L95WgLdjfqShKgaSaJq/5kAJlMY/fvqBPuHYx7MnmyfkUY
	zgRou0cUKCycEITW3WCTHAsrpYtQLAI+mOj0ztGYnYW6Cti4rE5pugB9lymY9KY=
X-Gm-Gg: ASbGnctcELL8h40Bx8oQT0h+5cFMaoZxa1Mg9OBjtcu8YU1fW8F0nLtZSljmcTlAuXb
	fS3zbV69kXQ33tLeawN3ppJGVE3zZzA5QYd/9XeZnQP6DWO6ydnEWQWrBDkiAWZkBcQ8LLccscQ
	EPad2QFZbn1TLu+YvdbHVv7u03uNROy/hMc5LdH5eCvU1ArlJ0axP3ZB9wnC31vLcKpxWnRaQq8
	sJeA31b5a8mQOLXYi8fcSsChhYJ7a2wbHmTCB4ZnawkO2hCRVA+lf4VdXo0nmdOY+1lW1XlHYF2
	sOtK8Bb77T/9OXj2ZpYcSYtWHPD4iQ==
X-Google-Smtp-Source: AGHT+IGSHfVV7ZgeNmbzBWx67alIxQ8s1vI3ArjQYk5K4x5dU5OensPI2MOkBdI3RPTXPnjlqYDKeg==
X-Received: by 2002:a05:600c:4f51:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-4366854850emr12697055e9.1.1734685425468;
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm40610375e9.7.2024.12.20.01.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:03:45 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Add missing parent_map to clocks in SM6350 clock
 drivers
Date: Fri, 20 Dec 2024 10:03:29 +0100
Message-Id: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEyZWcC/x3MSQqAMAxA0atI1hY6OF9FRKpGzcJaGhFBeneLy
 7f4/wXGQMjQZS8EvInpdAkqz2DerdtQ0JIMWupCaS0FH5UppfA2oLvGw3oxS4PtVClbqwZS5wO
 u9PzPfojxA5EIHo1jAAAA
X-Change-ID: 20241220-sm6350-parent_map-c03e9b61a718
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

If a clk_rcg2 has a parent, it should also have parent_map defined,
otherwise we'll get a NULL pointer dereference when calling clk_set_rate
on those clocks.

Correct this on clocks in both gcc-sm6350 and dispcc-sm6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
      clk: qcom: dispcc-sm6350: Add missing parent_map for a clock

 drivers/clk/qcom/dispcc-sm6350.c |  7 +++----
 drivers/clk/qcom/gcc-sm6350.c    | 22 ++++++++++++++--------
 2 files changed, 17 insertions(+), 12 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-sm6350-parent_map-c03e9b61a718

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

