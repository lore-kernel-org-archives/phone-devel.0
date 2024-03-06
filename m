Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600625C057
	for <phone-devel@vger.kernel.org>; Wed,  6 Mar 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713206; cv=none; b=g2dkcT4+8PkeMbgfx1z/BdFbE5pFNNp9/tcQXq8xPy5M7APhsRJo4+9inDgZyWetDRYL8MjM8M7c6yjrVKDmEc1icSU12dLbeXnE50jmch2LlInh9Jvukc5KKKc42SrrOmbzyGSXLwz25TNaNW16rsk4K0dv4AIcjCBQbtMbx1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713206; c=relaxed/simple;
	bh=eOXVyxGTQKrr0a/9S0g0Hrk5vw/Jn0sNrPViExOVtVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXFdRk6zbInIEJFhrlcpXcpqYzDJqh/G4+on5x7YQc0vaqKpBEBN+3NlOMvpCES/w2ZGEBjkzCcUm6OWL4qXX0n1GsvDNkWQQvJB1nGdqVGgYnxpy17ll21bWpCLQP1URbQXZaYaXHir5bg6Hr8AKl/TKTychEsyVHPt/29pc24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZMxQRxZ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZMxQRxZ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609d3cca399so9857777b3.2
        for <phone-devel@vger.kernel.org>; Wed, 06 Mar 2024 00:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713203; x=1710318003; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uZBC76fSENwy+KneqSdW8FRSfPWe31aQehHnjGJ1/Zs=;
        b=qZMxQRxZVf5ajm3d9RwRzJ8sZwVHluZ+yFozJFYQdC56hQHzVU7AMsVvtjvMd1Y3IN
         wFXGy6porYIm+B3F6dTvUDElq/L0vcz+sezeYH+d1To01FPxc/EjHuPmxJQwPZFzvZAb
         KPFbHh1+DRs6m2Z2Yo2c+z7aK3sh/ztMu9cUvCBzauRo40scXhn2IM3g1D3U5PmMjSQ0
         SPlSmQ2pAXGGw3u8aHUsmx28n502LUb9sjzmhHj6z0VP/moNZPt84OvGeXtUhAEZk/i7
         NRMCN147gUVlljMpqAE6NaMpJ1mn5oWVBdnLwTtZs/oXBUcSXGoo+zkFp3PNMkKK+ZMt
         kiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713203; x=1710318003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZBC76fSENwy+KneqSdW8FRSfPWe31aQehHnjGJ1/Zs=;
        b=AybIKvkhyBHM+BCmJGzXFX8gby5vQ3BxDerYisVoEXItY9v7x6n4DIe/gjYR3aaP2S
         y4SS+aWA9C6wjbKdHfNLqCp5ONZLyCAq0kteH3B5kpcGuVTR1keI5O/0JsWiY6jX0Jeb
         QuUL+4DjCKZ6eRzNxe6suLFtAj8mMJndQv1mXwFd4+3i8Ka8W6VICyAyQ1tC2DIlrHfb
         yIku7eKy7MT9sIxWCXczxK60gA8VjHiAeCspM2FztD+iePGm7wvQvzU0ymnn9VEMDezp
         6q1J+CVwKsSciFQdGtOJMPb9GikumAcoDfYMBtwTTX3djo7VEZUp308YvwwDDXSbbkkg
         sCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK5GtofsdC6hXPvFY5CDb3xkC8Rlr3j0bFfmZarYRVWeVuAQfmpcVd1Xs0xYys7L4AekbIbzXKRoDtDjAIgOfOnQ6HpbX4xB/PREU=
X-Gm-Message-State: AOJu0Yw3Vj/bq8xm/+M6rs7t3f4y7i/4j+X9rIPMZW2rle8F3Xi32fG2
	ucBut0peuIJOjiFcneg1lC/g7UyzS9GD24mLUdmJvFKsKqlIGHZs1hNGDpBLYE7t0fKlZkdYPCD
	gibMEVd2etOcKmFJSWfO5eRWQ2f3IBYqBELh49g==
X-Google-Smtp-Source: AGHT+IHmSEq4j6J3wCtEWvd0nDZ+HJhTa6lo6OjGsJL8RlcpCjZPLN6kBAKWI2pyqgguTpS58xSFj4shg2VyfA6Y9G8=
X-Received: by 2002:a25:9d88:0:b0:dcb:aa26:50fe with SMTP id
 v8-20020a259d88000000b00dcbaa2650femr11041610ybp.15.1709713203375; Wed, 06
 Mar 2024 00:20:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz> <20240306-castor-changes-v1-4-2286eaf85fff@z3ntu.xyz>
In-Reply-To: <20240306-castor-changes-v1-4-2286eaf85fff@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 10:19:52 +0200
Message-ID: <CAA8EJpqBHoGj0Brfiu8GQbxBKfB=v0-x=udMTE8wqVbO-rRjXQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8974pro-castor: Add
 debounce-interval for keys
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 01:26, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Set the debounce-interval for the GPIO keys.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 ++
>  1 file changed, 2 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
