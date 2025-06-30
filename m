Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB45C28CF44
	for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298083; cv=none; b=GfLO19u+4vjBZ8IRTWknl7XG8fmEU8JtJ2oU5ct+f2c1TFP3grnfs6MGUusuGPOuri4gaHDrXtr9wWkv2o3WA3LwH0sP6k3QEmQs30dTkCw4OJu8JORqsX67oERifhde5+3wT7MCoBF6kikVfYF62zibfpZLGcBcXnXzFgh8uG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298083; c=relaxed/simple;
	bh=TxdOtgVn7aBHw3u7r5Eza56bp9saXogFpjFjd1vydaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WbHuqul1WkF9VIrTir87SYjoLeBn4xDsodnJTmrTQDlowoilPjBulr2RZgS6T0grw5HZ3tzicoxi7UirjWZCjte853SbLrslZPAfSfibxLdq4ewQGy4UDltbdX7FmueGCXwDlg4OMe9BaVNJAg7CNl8LLmJKp82irSFqoj7+WbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/bvYIwT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/bvYIwT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so30600135e9.1
        for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298080; x=1751902880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
        b=l/bvYIwTLe+P/YxQ/fVthVLj/wfTXaueom7iYq9pGA7+Bvd4VgzG3PwqZ+lxILFWH7
         hEGMmAd6MnVHwua0SxlkMHoKunanemfIY9O2nxdZD4SKsPBoDLP8YMsEG2jOiOzlE9fa
         cKhdz14FkEtQen+0ydDmPnAYuzh/U3efxThxySe1s03BGkRizYEbjO3adrhWTZq/ruq5
         vKUATi+Y4/8s0Hmk3OjrJr7FSvexq4nzkv421HRr1Gh6lA0kWpqgakO9qtJaXLbuzyph
         BhFQ/jocYNXYRil7QSzNL7JcTqWIW+NhSK9PgAu7JeYdB8GPV3ztkB7N07npA+xLorDc
         TBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298080; x=1751902880;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
        b=L8HHFjW9Q3cPIuBhc8p9b7co31PnucKagF/hB4gZNfxE/kEjjBCzFcSg52hW1Om+W6
         F91Q+L4Rz8z8tWuEmUFNcOYE7fpgT+nItVDIph8xZSBWmqkvjkErL2yZ5v/GGFGf40V9
         kX8lZM3Hme9hsadBIA+Y2lhPHy3oiCwHi6g3hSfgD14tGN1jEdGXKe1pi6eln+EcQxUI
         lAXgGYNmGmqZauhMS1sW8duoR+xVkj2aJ22Mh/swGSmiMCO3Xixofn2BTenw3MaSO679
         /uRZp3hocSsL+cc36JzoHpsvgQrZVjv55AaXfdp7Qnmpsfy1mzFOGEx58GM5A1jBX2/0
         IUaw==
X-Forwarded-Encrypted: i=1; AJvYcCUqFw/AH0dZaB3mX0F//cCKFi7H7SD74S5QoODYLP+BcIBm12RsNoGo70GkQwD7P1GNZHvnjxYJHY58gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiySjlavQanexqjkKvl6PzPCdB/C4GQDEHqXfUBOXLfBsqvDAQ
	TvA08rQDMPp8+3TvuECKhgYJ8OsYtFpT5adaq7EdVzIMMQ0RAym8p2cItCwaFMVWoIM=
X-Gm-Gg: ASbGncvb2TF0qcfd0lQ7GdD2oQS4Q9g27Iv8H3lyrXLRjjP62b3aG8Oq6atq+CKXUrV
	/SMM7MtHL8q1IrBQlR+lgpKijThYJWqH/QFsyBnAXpZXsKB4TEIy14eFDhv2EzxVtHDl9sBlrVx
	k2PVtznVbogtFntgG70tNPK1b6Z++VoIN4VjkeiaOMZvxSPsuB3ZcbG+uJGRmB22c9Feig9Uzym
	odRfXrceK8lm96BsrH4WCESH9/5OFH2bd37tb7nNuQXOD+HoPEavhx4p6o4jQZsT4R/JrZKfI4N
	m3itjoJcuX5o6oofHsDw6j1RazqJbfH2zJdbPOlY7jFGqdELLXHqm1t5NAHOlJIQPqRYjoi4R8a
	9Xri2AhM=
X-Google-Smtp-Source: AGHT+IE4551ep9ypNSyk+kUT7ORHBKsH3ZNJO70PmyyYi6i5YwLUZhV22aROUA+T9WDlUEHG+Ihrqw==
X-Received: by 2002:a05:600c:5392:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45390bad330mr126646345e9.5.1751298079968;
        Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
Subject: Re: (subset) [PATCH v4 0/4] Add display support for Fairphone 3
 smartphone
Message-Id: <175129807911.2286551.14063311790282968036.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:19 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 11 Jun 2025 18:33:14 +0200, Luca Weiss wrote:
> Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
> to enable display output, and enable GPU as well.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technology
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/978a84297371ac33a15c56a7d31fd1b125427dac
[2/4] dt-bindings: display: panel: Add Himax HX83112B
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/54bd1390e98450a2c1cad99da3e2594e92c41a4c
[3/4] drm/panel: Add driver for DJN HX83112B LCD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df401fa1b80775109e2a52360fcb0b2b2300525a

-- 
Neil

