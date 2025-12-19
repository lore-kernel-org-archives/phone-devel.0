Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E60C27E074
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122525; cv=none; b=ZAtR9Kipnkaaq9B4DoC6Xl8jt3addfbhlNI3jVwbXv8FfhsIpOb+HHFm0fRP/UU2cLFxi3iE32TuoalTMfdJFg0mAv9vdZwa+Ek60js1oAdhaaxT5TkIqEDXc4aBjwson6fcZ4M3BwLta5j34AuqQhQWi3UCrpeFujrSerf4sGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122525; c=relaxed/simple;
	bh=ZhvazSte91iU+jx4QdnhFUqokDPmeF886UFAsqdeOG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhDgAqs6TOsikRuxGFFs8C8xmgUh5U3RIMeuANN2UBfSKa45aKjXE5A5xZlyKxWY1QbGM6X6Xy8n0gM6TvIe1qqqu3dScvx8aAM5yJB4D5D3HID12PNuLMb8XcN5hCWpz5tUCGggqg16AEgl1G4Q+i8WsBOBFJPYFo/EBfUAc7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs9p6BI7; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs9p6BI7"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c03ec27c42eso781615a12.1
        for <phone-devel@vger.kernel.org>; Thu, 18 Dec 2025 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122523; x=1766727323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=bs9p6BI7bmrcIORWo/ouvVkwMR2MJQw79BRm4iUgC8T1NeTqSeo+SIADqNiNXFRdBy
         xpFumRz9sK7PWNGUEHAGHUx7DUyiU79cCqzGvukkli+WKMq08QlsDDf4E/uoWwMsoibF
         y/OxEkomcR0WUXCfg7uCZ0RiR2knOXmgWWBzqtRaU2AOYYSCHWQT85fZFxbFuu5ICWmo
         GTHlHqXNFPE7lseUwS7pbfyIcSDCu2NQduswrqexxUVDYQ6JrJCxzQc13bW8WIsTbgig
         fSiCHh5BHSWQwvBsZoHuaPDFJxCfEOJxCVSyTZUpR4LN+QGxXyrL7fPpfDqBj64gCmSn
         e9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122523; x=1766727323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=MaUEJGPzcl1WEYOOyg+d0BASvgy9hkkAjo2cdsToSLkS2uVNV2XG7oItJ61eKnYcfj
         axYPwKAe4XLB/hIhsSPqPwS+OtFuYELnTQ6fmqFzSfGTumQJtHzOByZNKhEDYAqXMMsv
         A11OAkK8Tkj1CQocMdessdJgA3rvTCgT7lpv4pn1bjud7mIkEBkTFoM2dZFArTautxNb
         q8WaicM1T0thqDIrSn3CO/m5zWHH3f4UEvfNwBvA7nDyw0esUKGv0RCm9L/vw8oFjZqQ
         H6iFfuJ8azQdyu59w7OPErRyHkYGnDDO3MyDZZxo+COXeT761ym9cUm2sWqgu5NZgXHR
         m6Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW16dViOHosveHBPO5Mo9AE+eD9UPjHDbkXWdDXpmfSTzUoeF8otdgsCjFKHvAELnmWbznC5olhBhc/Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUzd3NM9EM9/lsBNcmSvDJexUgnNKJZHzp+2xUFzlTOUMPhO+2
	zSj6NRWyaTD8CvdLNtAjthCM+8gXFsE81yAimLcL9aDrNisAGF8Oi3p/
X-Gm-Gg: AY/fxX6VDxcm0x2Dz+6+noyBd3jj0PKiMqW9ZNuBFBdXEJcgU/JvqEBtRB2Az24eXJT
	RUfvje8FdyuDQDYlr0J103y9/B91lWhuAtYCEaSUDQLBu962hFyuI8bwU5w9bywgoXxUklvjwaA
	2GUk67eKrDE4raeicLtjhZumfTDL1N2GYcmc1ArpveRcwQrH8riCKu+TB8+GtStthChCWCiUmb2
	+dtwtQ1XMVro+9mJFElhyLjNb3PJvcI6BiB8omU38HAhuaH0bdipXWPjlR+fPuLpXWmPaoo/m4s
	VzHHxz6xb2pZvQkoYUIqLnjTq1YE7kgi0GhZdeRZNkzrEcrW5cQgbJ4GJcCb9DVNZ0YlAe78MPN
	f90MM5fy4lx8dqVtmuMlP968qsTaAYOEkOGuO3zGBpEUX3jYWah6PeS8qKVAqRXy6K1FaaiO3w1
	cDp3E2m5tichvyMGdH/YWl+nnciLa2k2EkP9hUoSjhIiQKJ3U9uuiSS++TW2MxogQ=
X-Google-Smtp-Source: AGHT+IEckbGoyBwvIpN7+hsyYKZeqS+PjBBpgEAIEIby7FqmlE1JAmvvNFeTVYuKm8/epNSNg9/pVA==
X-Received: by 2002:a05:7023:d03:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-121722ab330mr2043333c88.15.1766122522555;
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm4998600c88.0.2025.12.18.21.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Date: Thu, 18 Dec 2025 21:35:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH v8 1/2] Input: add ABS_SND_PROFILE
Message-ID: <ipazh76ewhshd3rtgjr4oz45zaqqmsqfdstu6nbxo3ctrd2x7k@wpd3tyywk5ay>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
 <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>

On Thu, Nov 13, 2025 at 05:02:58PM +0100, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> ABS_SND_PROFILE used to describe the state of a multi-value sound profile
> switch. This will be used for the alert-slider on OnePlus phones or other
> phones.
> 
> Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
> to input-event-codes.h so they can be used from DTS.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Tested-by: Guido Günther <agx@sigxcpu.org> # oneplus,fajita & oneplus,enchilada
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
