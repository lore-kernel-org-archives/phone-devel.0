Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075B37F8B9
	for <phone-devel@vger.kernel.org>; Wed,  4 Mar 2026 04:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600360; cv=none; b=J7kIbyMdu6W9pbTTvLIZ8C8ubU7FPV9y3BHT47SEUV9hg2TgyDGrDQM9cocmpF1AvpIkXmGB/qSPNaqz0YJ5i8pIc88LFBmc64ZgybpAJR2Zvo5L0PXfI/TTHBgipI4TJ2nGqDwtSqyNjmwh6ZQqQ/yk4bH3TVfydyiU//YNJKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600360; c=relaxed/simple;
	bh=NhgmQKsMwB8zEIpgqpqtkcZaPSWUSfgat9WpBVwGKAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+71IIF+cl1Fjp5IaeMkMZSIFMFgfQr2e1iCvdfmhFcIi0lXGDo0X5nrE/m5A92WvgoLHhMWCu0/AGizmrYdFMrl7a59seEK3yv3CjD30eOGFJf2r70PosIwSF8JEsLjnaP0GrAns2wZUVOvKDRg7VOMd2cDk48MHzUrNQ6JPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyEI9ya7; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyEI9ya7"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso3135895eec.0
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 20:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600359; x=1773205159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
        b=MyEI9ya7zKkbFBeQuXi8fryJgwOLRbyihfcv3WqPq1MmHZoayNdBz6ibNQiG+v2gtT
         84Lq7jDN9wDabHZJRdmZYKDe8xS7ZDgIUOhV8FZftArPoEgEufvOZGwcM7Vtq77jZoPq
         oRe1lkMDGHFu1y3PISoJOL00nacJgB45S5h7r6dVgdmL4AHyz3jjIULYszizXs640glN
         +ofqxaNTcS7Bz0qa9Gt8t+hMYMxDAxPqZ06z5orgfWIBsFVMfGBctEkyJcSYb1NenGmH
         v0nIg4IWPHGLkhHSYr6LcHVGqOrQQsdFVVD6843djzM49wjqsqtdKPnt/3nWl2jQVFNh
         A2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600359; x=1773205159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
        b=X1KPmz0uNoUQe0mc/2mIK32phbH1QwpNlDl+o/eo1OCixi2MVYOySuh5Yr3dTQE0Yz
         F9mkH9cYGyf3rJ70FrVOYd0SveWsUfklfOCH08W2Yskri3wwfOmljXuoRX2T/vbdMwVZ
         dtS/kvnSoezQYi2cpakFloxWWiz77/wdkueow/zrOO85ha9bAN/0Lsil0n3eUSh3M5nj
         pjKfnwNnuo2q7LoA4vdEjYjvaq4ARR4I9nK7EkhDoujvzidnnYgHV2Dd4wt8F4dyjbhE
         RaecpVfI5+2wiGT1CpG8UbmpTQ/c0X+UpHO3GwzaifSe/08LGG9tEI1cjCuykyKuMD83
         Q01A==
X-Forwarded-Encrypted: i=1; AJvYcCU8DMpOYvvCDivBg9r3s/GEUvxhn5Lzb/sWYqQUENKvYgXiuZGibwGIEfYIp422/QqPFQqzFD4YvZBANg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHY80luKTsNjWsx7w4Cjy/mk0hvhojghnpPcO7qSWch9gxAz3
	6rsis3OxU/mx56sidix+Gz131CrZOhBjsofiihp5EI8nKmDwJUoc6QAY
X-Gm-Gg: ATEYQzxv9YbeNfWMuQFN97jJv9JIVcqctTmv7oX7p7MzwqkYM/SogsYRXlWmYasacyv
	xD+55xFgc2O8FJi29evnOPZkp5C2xI6lrr/3XHWmoGoTlvREw7i9QPVYScl0XDt5OsoLqvxmgmy
	eZjtNQSILHbfoU7vKZDWCR86NH1EHtNLZ3eWVtBjrngs5BLcHrMMjb710c0SCpewf+/2G7e9kNG
	a8C1x1oELursB1a2Rq/YbGTxrfG/jv/6kOBx1nfLdU1NtmESnk0HVavu4z50RJu0W+H9TMlPsi9
	L4zdz+5cBqN0SDlX1g2aXfBis6mtAvghwvhI4dKu8ViyPMEys3TeqAuJnj2th9xrJ9RmLrDX3oB
	LY0mLv2NTl+aQ6IEQVkzJ/sUQdogxlk59fxrV3U/tTxf4KY0RKo5XnHfIMtwuTkhGAK0N5rh+sF
	yVnSCizv9oaB6G9FKbIRIEXNECHbOh6gdYO6hVPnqqdUUPhYXmFiJ08NyWf/1Gdhe0
X-Received: by 2002:a05:7300:a887:b0:2bd:b961:7e8b with SMTP id 5a478bee46e88-2be310975famr422928eec.24.1772600358821;
        Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1ce921dasm3981312eec.10.2026.03.03.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Date: Tue, 3 Mar 2026 20:59:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 03/10] Input: stmfts - abstract reading information from
 the firmware
Message-ID: <aae7zuSkAgNaciUK@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>

On Sun, Mar 01, 2026 at 06:51:17PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Improves readability and makes splitting power on function in following
> commit easier.
> ---

Missing signed-off-by...

Thanks.

-- 
Dmitry
