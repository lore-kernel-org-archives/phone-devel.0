Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D782E6CD3
	for <phone-devel@vger.kernel.org>; Fri,  9 Jan 2026 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767992462; cv=none; b=c9BmS8C+6ynjl2fx9Wbl8jNd74/6Jen9h9qiQwTOUmhJ+33fspQFIcs92B3vZ5bx+or+vKLharqloF+qGoa+rKAAmjpRWzaVJYPaOEir62RAQtWULZJmQD0RwnShMdpg+0oID74m9bbcxLQcRtBrv2HjaIUVwYs4eA9ZZgLaC0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767992462; c=relaxed/simple;
	bh=O2sLV7eTrr/RI9Ayewqo491c6WkHumteSOiKMD+gvzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6AWi7I7OYRi7JQUPB2A+gl1IIE4UYv8UVhXowGWCXhYYeVOOMWcKW9tkU22wrlQW5ITVoEkSFeTXg9bv4LhZgcAVD9d0JORD7qbHU1rXvoj96/nrC7e92Zq2UWzRsiEfIqo/N0pYhcCKUASvrtiamski/EcTLF6dcNkK/YJ0Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVanm9Hl; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVanm9Hl"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso22259635e9.2
        for <phone-devel@vger.kernel.org>; Fri, 09 Jan 2026 13:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767992458; x=1768597258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2sLV7eTrr/RI9Ayewqo491c6WkHumteSOiKMD+gvzQ=;
        b=gVanm9Hl3dvS9BFytFb6J1P4EW1d4oijuUZh22WYOBn4b3xANV38iQBaxtn3MbRvEo
         //Hqjjdi0AFBSFIU95hjshTMdNWNC8ehr3zVUHlNtULasO84cOJgCcLqm1wnrKQswlvA
         YuUzZFHMiGBRLXiR0NJaOM36hsAt2UKVR5hdhOeLW3Hl9pKgeZSLHpvutZTpWvgbnAY7
         gulZHmJN90ZP/xfJxK2RZbTGrMz4G2rORZ+Zc3GRpVNnh2bBlaGnWHXJiOZLkS9SW1UB
         d/mJecXArHRQ5pUV1NP2MqOddnF3mOvwfkDfb42FGaxQpmMV6senNLO19gSYIsPYeDfP
         mifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767992458; x=1768597258;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O2sLV7eTrr/RI9Ayewqo491c6WkHumteSOiKMD+gvzQ=;
        b=BAPT1qmPjhJs+rEOBw9FVFkhwbz1R1HqZGsahgUCocjjFhfFvYpPnoEFtF/wFDHKfN
         8pzpfm89XSOb+iboyFDoSir5Y/rcqO5qhiMkk1krJrFOw6OqdngyDg8ZftKeW9YIFLwH
         2HBzzwFCx+93GOmiDnuOTee7lTwZM5qKTcUtq0j20Uzks2Y7hxODOdPIPl7/FLMEajd9
         15xrgzBvhmUF88/an4p8i+tLMc7Vm9ddOf8c/8acrLPWAw6swP5vNZ/gpXVHoCb0mu01
         njHtYcXayxWtFNuPY54ipU1okSJzW4ldIJ7rl74sBgjtsxQ3JxzRO74COGgclkaslpik
         UpQw==
X-Forwarded-Encrypted: i=1; AJvYcCV30/nq98jaeVI+Bag2A7xNF8jpITi+Nyi0exItSuwRWBDlTzj7uVqfIMRXM+OrTPWC1QkW+MHr0ISPlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSx5kSPAecDW45u4Er1f1twp50XDDVzdChKEbuS5dBSJtsWgn
	8cT0Nw8Qa63fbChBnPPxM1xIrr03FlSfGnUSyHdWoILO/IJ6Uy9phc/+
X-Gm-Gg: AY/fxX5Jhy+HU/j9vdA7d7+XOU6/8YDTDVLVJupwjGOIZ3T5v+e2dbDwz+GwBb5HhPo
	HVhpFXM1ftoWivQfSPc7jRl3VGlr1xcTH1C6UOcma6sxDijJNyGNc3GjQw/NRD0UCrUHsNgfSxp
	uxWou7d0BY9mRlOhyghK2v7JNL1oLRtrQangobdiIAQc8AcUmIHVqNt0qMD/yjmHZ8wzO5kXGnV
	OUVwX18M0kCy26tByYOGyxrD4k4CjIKqmZHi94CWPl01SjvZOjQ45VfVc1/HIqglu59uwS4qcsw
	oFuhAcSNQyXTbDDJ96FidnRdMJ+PDhWbzI2W11+LyZvpGr6KjkBJUCm8uZCwgoIrspjontQLxZD
	bTGc5ezhD5MN8YuEIf5zOXp1R5H1pggna5lZx5RVFI/13egJQWNEMhez62u20stjcwQ4wAqS1Zy
	XgyvNVTcHeMNFHDc1PNnLpiZpCfPuX6HW6auV60/lNEfHzpB4uhBmTdKMTt3A=
X-Google-Smtp-Source: AGHT+IGHy41VxlRGAuZXH3hnp8V07u3s1R1wo3tGv2LD+zHQ/INTIBK3oBkHW+TRKWjWDPCXXbq0Kg==
X-Received: by 2002:a05:600c:1e1c:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-47d84b0a8eamr110263865e9.3.1767992458045;
        Fri, 09 Jan 2026 13:00:58 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e175csm24012329f8f.14.2026.01.09.13.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 13:00:57 -0800 (PST)
Date: Fri, 9 Jan 2026 22:00:54 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: david@ixit.cz
Cc: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io,
	u-boot@lists.denx.de, Casey Connolly <casey.connolly@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tom Rini <trini@konsulko.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Simon Glass <sjg@chromium.org>,
	Petr Hodina <petr.hodina@protonmail.com>,
	Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org,
	Simon Glass <simon.glass@canonical.com>
Subject: Re: [PATCH v4 1/2] doc: board: qualcomm: document Pixel 3 / 3 XL
 support
Message-ID: <20260109210054.GA140231@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20260108-pixel-config-v4-0-76a2212b69a5@ixit.cz>
 <20260108-pixel-config-v4-1-76a2212b69a5@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-pixel-config-v4-1-76a2212b69a5@ixit.cz>

Hi all,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Hopefully we add other Pixels in the future.

Kind regards,
Petr
