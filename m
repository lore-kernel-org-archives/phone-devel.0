Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6213A1C9
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486844; cv=none; b=I2VxfZyBWVE3ou4IvrdtnhVmnlAU7C99EmfCqYqYxEvIawoh0YoOJe8e3j9JON0gtcdAMPYhbqkeNr5i7+QZqKFw+4D1tFbZaqVIbzS09eAw7SW8OFHEXbgwBBp+FnGQayC4DSJ75GEpyqYg5ok2q2hv9/E2EFbG5jWD8295xfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486844; c=relaxed/simple;
	bh=xtWkD/+eVLwYuoIdhIwrfxzBOXTAFaZ2RwQ/1kjSxBM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFo0TqrKPZpNCNylJ951HSnGXyq7VbT3GJhgzXpcvI1orfnwiX2uJbjdIC+uffxk3Yeu6atv3k0DiajJNVB+psaAnO9gOf31x6HLT1QKRuG0t+gts8tBroRzFUXJhhJfsKI+dtWuCHTsTqU+DIuDuVLaQC3iY3eGHLfA2bF0p6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lK6rawBd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lK6rawBd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so50688e87.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 09:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763486841; x=1764091641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeYIGeECIYv+1PKRqNzOMqbwXs2hjyOg9yKuiCvHd8o=;
        b=lK6rawBdOTCXilF1kItgGKzXpjnanrqqZHRCKC6Tg5h9O4X1anf3XbGD8IwZxCyY9E
         N7JXtGMnD6zDkZjtnlQ7CZS2xKSmqaHmT5egOMbArWZ6Gnq2qSkG0/rvcirFKngW2iSB
         D9hT4J+xP9jgsLiaj+JAlLZ96BHOFp6eXxOLLEjf4CdzMt55xRq3dlk8SxNmSKhD1uxD
         tHDq4v11rEkDujoAk+ydyhwjO4dEHHyaXEOVCsD/uQ0mkkfr+PoFOiKl0T53UZJcpOPF
         VGuj2DEtJ12/FhYnDwkCg1yto6RJv0t4DoL22rVxGlHV5xFk0InEtBuz8ofJvwa9hdK4
         q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763486841; x=1764091641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GeYIGeECIYv+1PKRqNzOMqbwXs2hjyOg9yKuiCvHd8o=;
        b=N4htUdZD2YcwDItJqD0hMG1RoJVKitRI2jOr58/UfmhaN7NI/e/17oPgTKXwmSrTb6
         5DtM9MXtUdY5fZ3TGuGUH0HpDvkIld77JzDpRvGIRPXpVi0cRDFBmLEC7PpvWDnw0OmD
         PqNQeixdh5s2fIPpObZFYjIB84ekT4FxgdQ0U+R3L3eX9O907Ga8fHC5rdesPkBoGnqT
         eJq6ELA8Ya2J32phMa1a+3XSkNFOSrOmCMQS8EA0qKq13jJ3shxfmWmAHf7PLineuiFO
         wFX8g66dzQkaVA3jxkvKKRFfguhwW8o/Q4z+QUv+QNuzyUmYe9E0L98nN+bGaNuU5YTk
         Ljgw==
X-Forwarded-Encrypted: i=1; AJvYcCV86e5fMFVbcsQ+fvsZnWGROpeP01DqTG6eqtTf5fFAmoO3gAQqpson3MOJLXZvLQrw55anK+quaPMIuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzogmUFhySbLTmGQ6444AQun55g4nFwPcHqo/qIz8D0MqpuvbqV
	DGspyRPUzP/ku5ijTlcWhLM93upsVCG7GhDWEzVDfg8UCaPQFrNjfijcgHWXQzu+2vI=
X-Gm-Gg: ASbGncu/Xinsx6Q044jWTdLwbvcKuC8KECkGCECn3CluD7uqkxKd/W1SHqci2E2vdTI
	fDInmx4udAXk9SCxJ334PNM1mCPHao+0oe/SOMsFezhy8H8aMCvoY1/fVNgwOlSh5KB8+k9K4Vy
	tfVyI4LTDAhVLpE+dcrKT+twXUDNd8m1Sc87qYt5gHRUkVh8UJ5seVUX3NZ+UoPXfsZ5NXxuSIy
	zqyyr5ZLzS3IAWetylkIGovVC7MCD5Wvqy/TsJnpBbHVqXrehvba0oQb0IjMwO0TREs8m9KnkMN
	JmyRrC+Iar+clQmaF+ByiTsCQ16ebt0xuozzJuBN0c88GYC18t0LeAOCqZsNlXJOzdmqvfuipWZ
	iRnAPHm6nRYSyE6jLxrywtxTbjIon46bk4jS5riZbfAdUY50MbPRScA==
X-Google-Smtp-Source: AGHT+IHMtbVD5e6616CjOrb6Sjbe6GElqnu6dJjDGJNWdOtSNrU9bV68xcPDW2dOFoWXGtnS4HUs4g==
X-Received: by 2002:a05:6512:63c3:20b0:594:2d64:bce9 with SMTP id 2adb3069b0e04-5959d9c3e89mr74276e87.4.1763486840350;
        Tue, 18 Nov 2025 09:27:20 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804004aasm4124068e87.60.2025.11.18.09.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 09:27:19 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 18 Nov 2025 18:27:17 +0100
To: David Heidelberg <david@ixit.cz>
Cc: david@ixit.cz, Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vmalloc: warn only once when vmalloc detect
 invalid gfp flags
Message-ID: <aRysdXRCistSHSJr@milan>
References: <20251118-only-one-vmalloc-v2-1-fe702aa68d8b@ixit.cz>
 <aRyo-d-Sj8i0Trtp@fedora>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRyo-d-Sj8i0Trtp@fedora>

On Tue, Nov 18, 2025 at 09:12:25AM -0800, Vishal Moola (Oracle) wrote:
> On Tue, Nov 18, 2025 at 12:37:16PM +0100, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> > 
> > Without WARN_ONCE, the logs get spammed immediately after the boot,
> > on devices as OnePlus 6T (Snapdragon 845).
> > 
> > Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> 
> Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
