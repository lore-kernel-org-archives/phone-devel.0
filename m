Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409523FB99
	for <phone-devel@vger.kernel.org>; Sat,  6 Apr 2024 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712419680; cv=none; b=cKNy+IbO3aA5NsayHvInTonIYTl/ao0kgS2rxpM65Xi1RmLwPRgeqjl+oUr4i/hM9Rp7aWNnBQ8xauborE986U4t1c9HwhuMv3DODSUXl7ER6kx+guTAFz30CVWw9TB2YcWiPclwvKz3Vr/S7KCm47Lx4y3tVyoxN3oDUWW+ZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712419680; c=relaxed/simple;
	bh=Re9aog4YI0eZKksmQyEgqtuyaTCf0OysxZQoXoVWlyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z48YItUei0tzO49GLTDXDamJhzcSd1rK9LlGruFtt0KnEQAtuJg9I3WlHhknC9IZgzJfrrBXgKxY3zk6fiPaCDM7v09rIWWNTFvJ9hccKfQ4GOFYBv+RLVObza1MQc3mnCQxd0fvCpkSzf9knzIp5ciuVEfN1TXccw8OfCaQUTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVaYGjZN; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVaYGjZN"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso3063350276.3
        for <phone-devel@vger.kernel.org>; Sat, 06 Apr 2024 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712419678; x=1713024478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxhiT4mz7EkwRe7mA3Y1GYf1RmoX1+AQ0pJ6CUbqHqM=;
        b=pVaYGjZNljmYK5haX5Hk9nYOp6BhsAH3mdQgdq+OqJyWFba0DR+R9VqzxnFXSdNclr
         d4P5/y466v75glXTyZK7fS69xlZyWkVb+Tl525LxKAJ8w7dwXijXva/CWI41ndNHwj+U
         qkj2yhQbRvZdxWFhO2Wgta9gaoWqkX31cdxhBA77XboKgU0xzLd8OqVYgTXEJN1M0Hn7
         KObLOcVso2E9XEcJUsdTazCSdr3EzTKdjWgK/D3mPuJsu8e4KMe/VemUM28yChFKQ8Hv
         5ApA/eeqDanfOr0JAroOuWl0/QxP4eCJHfdFH+ppepNL21sUscTrU9R3ZV/eomiLkuOh
         uD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712419678; x=1713024478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxhiT4mz7EkwRe7mA3Y1GYf1RmoX1+AQ0pJ6CUbqHqM=;
        b=s1R1FWs5hchNqYkrxlobztQhssiYE4MMqiSnuyPEMxjXE14ap29glsbS0cqgdBvUh5
         Am1PAJ5Y1rtaQTpWEK546N+drFz2MmGkOscTtdtRE2m0cchpToR2mcn4wEX+WX7shKoV
         4ZxUJcOBEam/pCpnufYRaB2lg3VtCC+Ky+Bn9lrgwHK2hwdBSEUICZhPn1OHZBt5sOMy
         c3fg3vmsXfiVxElBRlBg0ZITw1DtBAJc8OixCAenMooJ8dFx+RVv5KqfGH2po8Om6Eiz
         5FzMbs5bOv8sH6ahJjCMrJfwg7EVlsI4PJT7kSMMMeAEALw4ZZfzAjC5nWRybpghnG56
         yRgA==
X-Forwarded-Encrypted: i=1; AJvYcCVwnVBxngYtZPLsi01g9mYiN7Wlkauc96WCssKHEaZocfvH42D3DBOnFyTPEFeTMGbEkEXJ2lVi7/LjAqX3OGwmATYw+F6m/XWvljA=
X-Gm-Message-State: AOJu0YxowKmIpQ4pQJ3pzXPJYJH9S7oRVEX+JasotfZTq/wcaUdh0mz4
	4P/iTeuMa52xgcLWtsS57cQ9VgUiob3bc4mK38cN7PwpcvdVbBv7AvqHjtIkkwpaxcDf5He484F
	+cZetb7lhKaoHPMWy3XdyX978Z+I5wk0qUYj14Q==
X-Google-Smtp-Source: AGHT+IHggO+6U20SEYFId9dF+T2+hCDTSyO2Vax1gDweglAaFNbjoPCJbiYC8M6TObeewBzJ5GyPc4eC7fPDozv2hHQ=
X-Received: by 2002:a25:6a46:0:b0:dc6:2e29:4262 with SMTP id
 f67-20020a256a46000000b00dc62e294262mr3611046ybc.58.1712419678311; Sat, 06
 Apr 2024 09:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406-shinano-vib-v1-1-fdd02af39d56@z3ntu.xyz>
In-Reply-To: <20240406-shinano-vib-v1-1-fdd02af39d56@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 6 Apr 2024 19:07:47 +0300
Message-ID: <CAA8EJprxuhE5BNw4LMUkjF8WPi-oBzY5t6LrnN8yvjfguFPoig@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-sony-shinano: Enable vibrator
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Apr 2024 at 18:36, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Enable the vibrator connected to PM8941 found on the Sony shinano
> platform.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
