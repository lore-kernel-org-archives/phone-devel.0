Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59538377E9B
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 17:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485950; cv=none; b=RS3529wWDChQ1fMrOvqmvkBjE2PECMTSrbpVSPpr2Q4djUbmHyOUK+jsY5hB+5/V0A1rQ2vRAPcsHGYqy54SJud1MnABtNORpof7fX3nlBtAtpK66i1KSJqBJIlVfsF9Eq5g+nJ99fhGGswfRDpSYq5IbhVDdugAGTz7O3kZoPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485950; c=relaxed/simple;
	bh=xlTJQrsx8JIvKGzfaWKsJvumSuQnXXkf8GRWhbYMGh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqpANwzYINWgO5X5w4D+rXtAWxDDOFH0/dn9vZ+PsvYK7eQ/z8B/zprQPXwqjBW+hafXKqTX7zlRpFnxXWfZsyeEU6xvmhpXdTmLJsBKmeRGbSJO0Hgn4+ePjIMKO3kj+B9Z9DSAgdr+e49sGCbaee79uiLEmIZ8dS36orXILHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqyDupu/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqyDupu/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5001933b3a.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 09:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763485949; x=1764090749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4y7c/pUe2lZzCT0WD4KXTZ8Y8+apAqRGrFNn31Nc2Hw=;
        b=SqyDupu/BINOkyJONaIza+CcHOWoZzxFtOZDQ2FCVCL5zSynNJjP1+R1P1ikO58nyD
         VJslpJ46bWVXbNR491JzGHrgnvQ9waUCIoJVYKJ9+Jwqz6SqglYfWpTXTUG1DowZFJxx
         MfmKRtP3sxEg8YkJuEaPBIzkw+g8+vIw/MA8UV1OEvSQRQEJwnVuiKP0VMmSs/3pqTrc
         OioMAjVCEbPj9swrxGi8Ao55777jOBj+VnIQXfaJ+7BVTLhTZ/gACia7hLGqfcNTxv6u
         VDu4KCdBJ1kqi+4MUAuL+y6f/23I44sCSsmN1bbrFr/HYAPr5WUmeehyOfmVPIw/GaK8
         dadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763485949; x=1764090749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4y7c/pUe2lZzCT0WD4KXTZ8Y8+apAqRGrFNn31Nc2Hw=;
        b=HUakx4OEfq76XlYn+T3qqIxM58IfHoNH7LAly0DjDAYaKBpgbsroK9UtnJF2TTgoey
         iXG5bg0vHdGo64wxkEppWvhRNb7QlGSQ8qxZw1vuVR8uPUq3w4qMqaMc8081owz0oiHT
         2ILfRN6FiPkE+Sbu80VqrUGMv8X7ltgWalCV0fTppNukWc56cCQY2yRGhpHdC0mQs+9U
         32f22iyTVMWBiurVNoK7tRHTlPlDutbwWZphAMjQ9sRK4nVdcwqBITyXO5RtFLcT+3hD
         UsR773I2wPar1CwsowZm1OJlEekjn23xCawDE16Iv+dPM9Lxjj38G3kr22TvkkJtumAS
         LqHg==
X-Forwarded-Encrypted: i=1; AJvYcCWzOqbU0RKyxKg6J+kJgueX/ms1Q0pbIMpctu5bDzSR5gNF3/6t2LY5Ky2IY2jYTQgfP8KMFT1dHhDXoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAYGbUG/kr8sjFu7Hc5Gmois4VWlJXY9dlWYDITj4rzXa7zot
	6CDZElzswrVFXbaWeakuSl5wBE3rGM4wUkpAbKxxkyd+tRKUX2EKlBJc
X-Gm-Gg: ASbGncv/9mvkaGul+K1fkct7YF33Vna8le89UrNnpUki2VwA7D1snNnV5M+xdagAD5F
	De6oaWoV5t8RWQ5cdO8md34ugkHXucR65GN/sm2lSYUHRLhg+7dv35qobwJFREH1aqmYEN9ftSR
	aINiGqpt3ih+6RRdxbfzfuGkibCpbfk0Bm0d2Vtl9dd2HWA1yXaV2rs+vlyoUjeDM4ORQkQE98E
	s8QLSZjA2UaVrzJf07dyyERVIZ2L6CT7K2gpEDV16uVL57tpEC7DB9WQNPN36HcsFxXqopckF6u
	OLfNHrfCOpTZ3Y4TXIg53eVCcOUyHwbUAQexI1JQZinMsW8pziPGD0B30unK8nhbNpdX34Pgnvq
	vr2PgiV8O1botMDD0QNbH6neTgDukDpFtvHD8toP26ewQGbNRQR778C4fyHbGA/ffcK12zNvppC
	hmV97/McM4L5tMzqfyePwwIe/xa6XfsaSEFBHTPLhJzHM=
X-Google-Smtp-Source: AGHT+IE5NnaqnKmma7kD7B9aShWAhvkMoh5NKfXnJg0HqNhBeM3bMSSc4oe2QBLZL1k3KXgz3JVCTA==
X-Received: by 2002:a05:701b:2514:b0:11b:a36d:a7f7 with SMTP id a92af1059eb24-11ba36da94dmr2687889c88.16.1763485948511;
        Tue, 18 Nov 2025 09:12:28 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b80fd6790sm34781822c88.10.2025.11.18.09.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 09:12:27 -0800 (PST)
Date: Tue, 18 Nov 2025 09:12:25 -0800
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: david@ixit.cz
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vmalloc: warn only once when vmalloc detect
 invalid gfp flags
Message-ID: <aRyo-d-Sj8i0Trtp@fedora>
References: <20251118-only-one-vmalloc-v2-1-fe702aa68d8b@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-only-one-vmalloc-v2-1-fe702aa68d8b@ixit.cz>

On Tue, Nov 18, 2025 at 12:37:16PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Without WARN_ONCE, the logs get spammed immediately after the boot,
> on devices as OnePlus 6T (Snapdragon 845).
> 
> Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
