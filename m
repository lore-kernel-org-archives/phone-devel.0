Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE222C11CD
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770774736; cv=none; b=gJSKa4MVdfjCHk8Qsrpobb5tWeboFiKXe9vtvTrwzWqEQzFpNZymZkT887GxkdRy599gUmVtczrfvjgkVB2+4n12SiiHwtatdCizDvx4YCsZJmFQSHOBJZQBrrFZwytFNptuggGgjmDt8maPncAvcrJOq5sWaivsNIOSidWgDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770774736; c=relaxed/simple;
	bh=A1SS4TKzzKgvQKNJqUbY09euLXdjy02UR4+Fo+uBiuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grCcqqSvsVT8LpTr2ymTioWF1OyhLBbZ88wPzx8IAfDU0+S7D1K/c1iMgMb/EfbQ202GXkxZ/qneASidACmC8rtNj5jzvJaKln4AoYeLzz7jXJ8qSeH3b4SiPEYyggtKG/gBLRTj9Hy/I0j1i3XngQlhKCuZAlmD/Jo8iRvZsHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egCvKxcb; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egCvKxcb"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d15b8feca3so1472270a34.3
        for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 17:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770774734; x=1771379534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm/euDJIj38jkfPBdt87UcAMoKQj5lm4rAH2NrGeusg=;
        b=egCvKxcb8JwPqdfB1s6m83mGQUW4MZGiVuBIgyjYR4eifeYEcpGg7x8NTZMSRelphn
         KVL6imJL8ixuX9ae4zfUf+w1CKosWCbpdkK4PY6RreTbG5S5zqO/Gg9r3Pf0Onm057ox
         59sErcC/xUynqbAGYpzItFAa6sOQzniRqdbV40EyvMcKXaDpPFQ4y7LT/pzI5XdOuo+W
         Ki+cIUxQOsg52oTNNaKqfamzfBdgKXPQdj1I4Po104tUOQvcYTCoaYZZxOm3861ZrQz9
         qY1OHSgD96fAz6IUOnHa8GSoxs1Suj/WTnexfl+mhs/V0TcmQk+FovIJcYBtAP+G6TjO
         eGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770774734; x=1771379534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm/euDJIj38jkfPBdt87UcAMoKQj5lm4rAH2NrGeusg=;
        b=YNDV+yKpqbkk354pi8y5sYrtBGBVzE/IExpDn2DMjaCw2Oq67AeHoXNKN1Z9VO0nWF
         T1aPm9AH1lF1UjQxeIuHuZ6VQdwayNLnv76fVCZyqHrMsqGzsRYSUFKiM7U9tTjoKDsv
         d2XzZO7GKbciUOY3ItnpRNDqHcsm+z1W7rVilai4q56Fs3xqefC7twjYWf4MjXxQhRU8
         w6qb/xsXcUuODavW6LkewYvl8HqMHobW96ot7DMosnxbx8gjtxqBLOOo2wlnYew0xe+s
         xPdenJp0Hd3NxzM4UAUaHgRkA5MaSb3E7L0EFo0bg7uxAeaHPZnfP6Gm0/wRl0UaGFrR
         jz8w==
X-Forwarded-Encrypted: i=1; AJvYcCUFs8/D5KNvdkCdDn5pnnsuYcZ5G9/2lTzXw/9tNCSKyzdnRwNN/iqhTMVzsELWNWWwjb+vPgwPPKRSeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61fBeBeIPDghqe+f5YYGCEnTeRLb0mlsjPT86eeXrL94lUCqs
	Y0Eo5/So1GQd7Zvqz6eCq6zcLVjwPtdJOEuiI05hpNEk3uQFf8ZJx49e+jQtow==
X-Gm-Gg: AZuq6aJ/LXqE9ATLrP+0ifJS+qj1Qa4dbM5IB3YvDzc9Yj/0Ln2/kg2HHphG2/pYNmk
	okoJJ36iwQ9l+QsrmkAt3R60JC9t+GGSBbesBNUCTm9F4l44LLRIjeBeGy/dqjrr3JSlKSvph7k
	wiOGlLSD/SfGDeMTI3wwn60MmzS3j2V3fK7kDzlw9dfl5ysAi5YacJEXWH4Y+guJiYlmw31wIWD
	wh5ObLKAllfh36ZbmLQSGhz0Qw9RUzuwNiFaIjw+ecYcAvEOnoyDjJZQcUTaJw0usUUdMuFb0mp
	EKwZz/rhbExs/E2DFXlZm4ssyhOnZiI3j6/ODeznfdAq99Brv8p15HTzo9XEw6om4/vUzf92d+7
	L86evvKfWyQCHsnBdxxLOedXlxTpiPmSljeewHL3odcJmEDFGLzMSl0DmcfVdCxeYQqpzAvqloF
	+NLyC2Wk9P8LIpjbZWUt+2LN/QHA==
X-Received: by 2002:a05:620a:1789:b0:8b2:eefb:c898 with SMTP id af79cd13be357-8caf2389cc5mr2130416885a.69.1770769291885;
        Tue, 10 Feb 2026 16:21:31 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc823a4sm1881586d6.8.2026.02.10.16.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:21:31 -0800 (PST)
Date: Tue, 10 Feb 2026 19:21:58 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 0/7] media: i2c: IMX355 for the Pixel 3a
Message-ID: <aYvLppaYsNDDD4DX@rdacayan>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>

On Mon, Feb 09, 2026 at 09:01:59PM -0500, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
> - restrict data-lanes to 4 (4/7)

Apparently the 4th patch has been blocked by Gmail.
