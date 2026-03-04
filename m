Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D31DF742
	for <phone-devel@vger.kernel.org>; Wed,  4 Mar 2026 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600481; cv=none; b=AxL9owSpgYOs7SfObQZCMmQopR3Bfax3J8MDYJKeMZX1qK72SBgy1JJOzpEEb5tNCcwMYYQ0ZtYEgBiK1llIuQmXptA/xKX+cEDEyzosLcGaT/RH9BImicVEkSdehBHnphde3C6VQpt0hUj1eqEToyEHgGtA/EqpRLexNLC9Ud8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600481; c=relaxed/simple;
	bh=q900SxARa7WkotcVHjlQh+90jJwX7uIhDq9gH9l/QfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uluRMO4BEFj0G7dGFBYbT9C5ZdJF3NYnNjBMwxV2jRQWKtBCevD7adzROjL91xr9gAGq0WDB125b02ezDx42+ZysZwiRgspGtn8FzQQaw+D5FHurQgkiSRKQOi2DYZ3ME525NQRx8s9a2zaGjRgT0g60D1OUltPYfV7GLju5VJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noVzN0gY; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noVzN0gY"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12732e6a123so3943244c88.1
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 21:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600478; x=1773205278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/nYbvJ2Ie/7AoV2hxQbNjt9CPBgI0NZpDJT+MhOo98=;
        b=noVzN0gY6eDOmqdIDzhqW7qhaHHSELHcvJObBWE3FYMEO/OLSyyhqgXb+Pu2XWdyAq
         LI7wT165K39bYeBeQxZE9Udgs5sijUrIh+t+s6aF2TyoYRsLi6pV3tbNoyerqGwIFUSo
         Qr4cym0LaZmn0aKkCdXz99pW7FlPrWk4pv4yLTG1S8MgOVtAW7GQeQ61nlIgc+HjDGCV
         pMmoZBG9RO5WHCegH5cDgy5EipYHDY43UJUwMTOSYbZYOqHCaNtPz5Gv3Dz13GmNCPeT
         rZCHThWX18UcDrkdEHrsnI94B48y60CtvMDdKHvIgEKvDn/gDGuALJmgOqFGk47pHqvw
         b0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600478; x=1773205278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/nYbvJ2Ie/7AoV2hxQbNjt9CPBgI0NZpDJT+MhOo98=;
        b=uhfwfCxaFDRnXMl6Gbb2wq78HTz8y3y0p/kEvQkuFx89bGaiOzZFn6WMFwHA78f1tg
         /Kh10RMzqiFvnef3o4Kc6l9p1QocMeb2xN+2vcunKC9T4cpf5n19pJgZcfOaZ7UAJSDG
         RmHqSHQpZa50Sev4A6Wt1JPL1PAc69U4NFXXi6jYrtEd9i+Qp6929MvnI3iZlvniuYlF
         xKJfqphQ7UG+G9YYBM02tGtGUbU3meYVmRZ9KpCIRnYC5nn/Eg9zhRN0ocRSO7EeUeFH
         x7N54ZKG029i/PgTquD4DHJKeVRPNnRBJtVOuB/2bbjTvfbSR2sMEqw2ScNkUqt0FI27
         D2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUnzXWfVFBrGDDTblHdQtb9BAKVD6PDlqfAUJoS7gU8EJVi+f23OSKyaT3mQ5f38xSM+9JR1ZRGNEeDkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUh7GNJDst1lChE2WjnKizaq+zKAJptgfT4/hVAxitl6diShh+
	StiVe3TlLQ/uEZUsZ3mqhj4fNVYcfEv5Cvfwwf5HkuZcMILJ1pF1JON6
X-Gm-Gg: ATEYQzz1RKksA7HR5IkGLPutjlx4+k4vjH0EAiTUEOPkTDtLm0x9f3rAdADoEHzanrc
	lQS39EwhW8OUH/yXmOaG3IfebFZBtJyCFxmmAhBIkN7PpqVl/2bq3WShjyFn35yvBqBpRyp+dmQ
	lxk5YaySCkYSBGpbCm5RiAGKA0HciyfXH27i6iRPs7wFR9W3HGFRequSUoXfLBDMePVecTgwuSq
	Ve5z/yrj+ZcC5hAuVe1Hhcq4CnXZ8KBDAdqwRSF2mC3CjxmEYGQNMiGCB2PXP1if6yVgOo/X8qd
	fB3slfI1lvlag6gjJ5n6sW1PVnA2xSkIP2sawOw/PXwXyTEgLyi7F9AQ0w5zy1BZOp9ThAf1idp
	xVwuiB/B51SIXaE3DcZfv9HlkmByIndkembgrQ3F4wsivOGBYe0NzQVRQdf67JVaYROZHOhs4pf
	cM39obOR3LJFDg0DNXNKY+js3ZDFs/o4MzbDPbTdZUXZdRnUdvao3+5vJrPXUMLiVN
X-Received: by 2002:a05:7022:24aa:b0:119:e569:fbb2 with SMTP id a92af1059eb24-128b70df522mr302307c88.33.1772600477988;
        Tue, 03 Mar 2026 21:01:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm21528620c88.6.2026.03.03.21.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:01:17 -0800 (PST)
Date: Tue, 3 Mar 2026 21:01:14 -0800
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
Subject: Re: [PATCH 04/10] Input: stmfts - disable regulators when power on
 fails
Message-ID: <aae8OqFl5Aejv6YN@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-4-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-4-22c458b9ac68@ixit.cz>

On Sun, Mar 01, 2026 at 06:51:18PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We must power off regulators after failing at power on phase.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/touchscreen/stmfts.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index db2dd0bb59fcc..f4e5f1b3ce796 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -558,7 +558,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_read_system_info(sdata);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	enable_irq(sdata->client->irq);
>  
> @@ -566,11 +566,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	err = stmfts_command(sdata, STMFTS_SLEEP_OUT);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	/* optional tuning */
>  	err = stmfts_command(sdata, STMFTS_MS_CX_TUNING);
> @@ -586,7 +586,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_command(sdata, STMFTS_FULL_FORCE_CALIBRATION);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	/*
>  	 * At this point no one is using the touchscreen
> @@ -595,6 +595,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	(void) i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
>  
>  	return 0;
> +
> +power_off:
> +	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
> +			       sdata->supplies);
> +	return err;

Maybe wrap everything below enabling the supplies into
stmfts_configute() or something to avoid bunch of gotos to power off on
error?

Thanks.

-- 
Dmitry
