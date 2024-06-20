Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1A64A98
	for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 20:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916134; cv=none; b=aCmOKLwl8B3PJsl3onWN+5C57BO2IwAyB+569lQtwbxrDcmSro2MFfhXn3PwO02EnA/c+X5nX9drIqmq7h2fch7X6B3TllZF2hT9cENnYEgy0ieEFaQUORTwRobE0HVwlej4FVmkrYx7GWG1Bv3UP0BH8XvF2/mkRQRkiHTAn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916134; c=relaxed/simple;
	bh=rZTYzdCvbBVM72bJ3BfGpq2tUtYH+usxtmwVz5R+FIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A05iBpZ3hIbbcaZtKctHd/nx5bXZ24QzSr7Xao32UU/DhSML3o/LCa49BV68+dWlnLut0i6QPwoV/+tyZ4e53vrnr9HeZQqVhdMK2FOvsl/beQf/klVmA0HJgdD4VxqZrMVVrVIcUn/U/9ye4pvbvVMONan1UgGw1Hb0nLE2cuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bC7Jnas5; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bC7Jnas5"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ec4a35baa7so6024711fa.1
        for <phone-devel@vger.kernel.org>; Thu, 20 Jun 2024 13:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718916131; x=1719520931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6K5OP7x7yq5Q0DYuXqAaTFJPJUMdV4vBwX3KqhQElbE=;
        b=bC7Jnas5Qo+CvGeVWWd+dNA/ZCzrR7DK1VbveLiWnzIx2cHaUXdGSaYTsUIFUzqJiR
         9E753WZ3E0WxaiCIEQWNwrDv7uIKqPp4mZo+xTnTjX58j8PuszEwzZEMs6uVsFuNoLUt
         FuPMlFt54f58RJ5x0nd/i+1Le5suy8PwgO1j2qzPnuLioWGVpKFa43iIp5zG5/a3AJoz
         Xx7USY2knvgAWsPw3FmBpBtzsjuY7ZM7PVgC9USw4s3ZEN909mChwcjgQ3wR8C0iQsEf
         zmVbTyCnrG1B8HMOuU1PjnuvOEdlZ/2wFu4mBdIr8RS/C2HfEZSIrGXTovpK9mBgaXan
         LPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916131; x=1719520931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K5OP7x7yq5Q0DYuXqAaTFJPJUMdV4vBwX3KqhQElbE=;
        b=uS6bEN6v0vdd0AqRSKgmB2eozNpZWpADGLn+zEgluNY0gCPE2EcJ77meVFJzBinDyo
         b9mdFACCYkOaPNewOyCvFREEiIy/kO+1RqAukj0TpAu0iuA7oXSucobUo+vEp15kUPNB
         SbKfu5JtGVuMDtHJDh/GwdF6ibq/ZYl2EIOTFsJl7IiaCejMveSWo7aaIZOaGhzSBT4k
         70wJKdL9DnKeo3smAvug8zHCKko0ORruP/WBgTtnst+qZz9FYqpbjDd0Tg9kF3fFCtIH
         JIczwn7Ctu+hBCp9ZlWoKVy00zTMjdGDdrVh3gq8r41z1KSxSJcm1WXFhlAK4fFcaqIG
         vofQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEGvZ3WqyjXUZQJJdv3EsPM6Iu1TqbEc5kEmd0w1+5bcBWeI3VYLQ1IQ+l8nIR7QImnRgVxKK21DvGVj/uCb/s6BWHASogbDygu7A=
X-Gm-Message-State: AOJu0YwZYJhMMLS4fN8P32w6s+Wdsrqk/TvK0NfGPYiqUdYnESLrj4KI
	MF0LIfkGNZ0ChDQO3Qaaj6121/kaqxKOrm/VMcLISnNjEUjOx0ktrQbMvCkooQY=
X-Google-Smtp-Source: AGHT+IHa++EtjUUyDrE9RDcUSFkXO7DWuSSI9krY6EtnVLoSOEWveJuA9bY90htEUz1EKaY81P3z4w==
X-Received: by 2002:a2e:998c:0:b0:2eb:d9d9:6ea5 with SMTP id 38308e7fff4ca-2ec3cff4a6dmr17759271fa.26.1718916131531;
        Thu, 20 Jun 2024 13:42:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec4d600c1bsm167431fa.8.2024.06.20.13.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:42:11 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:42:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8976: Use mboxes in smsm node
Message-ID: <5zxq7j2a2juahsy3svlog6zvjkycejmlj7zqesgtllxiw4iw5s@2zwrllvtnidi>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-5-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-5-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:31PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
