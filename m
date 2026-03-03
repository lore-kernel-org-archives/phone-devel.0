Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE538CFF9
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531589; cv=none; b=OwPLYntx7Kz/R/RRErWbOgc/HTkYR1ROCkEbIOiH4mQF8GwrOvMHFwSt5S4pfvFWd6vw9Nppni7P6p/CeN7xTCzchqc7FXN5aAEphLCnqvKf5e//OzEliD1NV5Y6EFAqoK6Ri0OVw0p/Vbyfu1y4dmGlFhJDjgYLkZJ0mWMt6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531589; c=relaxed/simple;
	bh=IUoIPHZUV2R9A+Mx4Btcjsw5YBqWJfm9lzBZp+H74IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCKvxJQfLbMRykxgSp/Se0f5LyDKgV50eqcmfrNCWi5uMxnDmlNLsosoo4Bcpazv7hObMrSlAKaRSjwEWqCY48/MLdgcQlrsb1xG9HJnF1fYEtPJ2+SsgtxK/+tgghogEDtMCHXzuDOETFzZxghi7nHXQFJApS8VhkDO6oG0nqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kXYm5B5N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kXYm5B5N"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso45986205e9.1
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772531587; x=1773136387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtvdeG7knrqNuYWeOBqbghOe0MSRWj5nZRbFtfFtwLg=;
        b=kXYm5B5NpkUwI2XY6iv6fkKNvYKqx5OaSg90cAa+15SBPzwIdkNXytXNyzIKs5TQam
         AKFTKibCPE+UaIu4ubQVozfFhuZZz2jYXh8eSJGiEdPZrLFS3uwDItBe0+SLxN5P73z+
         LOBNCYCoEYHB6zaXgwDzZOZIV+2jV8LSpw4I0TyQp79Fl47CLXzBRJeoRaDB1Pb02TqK
         UnlFvUlF4l+GsXGeJAHomFu1qmpRQJGwblvoLDAWr1xkuGQQ0/HDg2ZTZd63lgeqhyQ5
         PXXMT80WS2iI90Jjbt03/Q8shkdGIp5Q32HJYkhZxKxiNW4mgNCEHXJQDxoQQvjx1EyO
         dyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531587; x=1773136387;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtvdeG7knrqNuYWeOBqbghOe0MSRWj5nZRbFtfFtwLg=;
        b=cBVlL3uzVoj5Cdps1/xs04dXVu1/NOKLaxx2GG99pDzHy9QZ7JWOVcuBbhhYzlNMod
         1jgYOZkYJVGolamngmFBmT10q9H0mmKAktWyrTvhRJuXbChuMTuaWCR5kQfRcHRqz7I0
         d08+vZmQ7PXyV7wqOxqjH2iXk5wKvTwo7bkT6E9c3Ie5Q7MZ6q6SXn28eMPng9rf9cXr
         ONCDD6nARHKMtcPrRSAuWXqjgwnvkV8m4KMCVkrLTiPfHj+D65VMnofcPqJ4z4T6Lgrw
         euKeAu833C19stB4Pe8pJHBRLSGPwCspZUV9RrAjMh0SKczvnrJdIqRNPejtxEi0UDZ6
         YmXw==
X-Forwarded-Encrypted: i=1; AJvYcCUDtwbdjJFYJMW8qfPDc1YeTYp0ZvV2EzYW+8HVTHBPfTovjfJYJDh2Sz4r4jtC0CtIWKyaQ1fGks2J0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtlUn2flyu/xsx4Eo/nBvDeeWuvruIiKffQ8JCSvP8m5NcYa5T
	HQRSVt7p3ZhUzeaGOczUsdJF/wPVQAaDU2smAJ3ODEQhOdoQxcgbvWxeJbli8XtZv50=
X-Gm-Gg: ATEYQzzAx/QXZYa3fxn+uq0l6feRGVPjgqOrPpTb6kNgftGNP9M08dQIREVpilHu6xB
	ctBv3PZqUlS3xZXRMYxCvuwUM+XB25RdZoMD6qEH2IsmEMXo2SMQAZosfzVISsBc001jEKOigDG
	Ke3b8ZVkC6GUIbK4xgRJeclvrCErYHAfFtyHW/nbeO2HeD1D2oxXkUGzcJrHdVIBZ8r63Rt8YU5
	YDchCfk72Oy3kXFmeAf6TKpydKZsA4yVN40N5AS63nDfX91Oo2i70eoDVNJMutz35Y1CKfE8KRS
	bNhFTZ41BOwIdSXcWDvAkpdUMdQP/3jQdANxL7Ta6R7+NVIFfS01zgQtJ6gmgEo5BGK0PY3koyt
	iDxE3tHpYRnA0s8hOcCiOPxpBhTv/NoR2cuaULn42LhnILeBjo3tL4YElUmwCJedfeQfCMbvxkT
	G+RvPd3NR62lZwap54AXCL/tTouQfz9RLRf/E/kdIFL42XaaPTgTW3waHhiXtdwj/l
X-Received: by 2002:a05:600c:8b11:b0:483:6f7c:19f4 with SMTP id 5b1f17b1804b1-483c9c0b6c4mr264389115e9.30.1772531587016;
        Tue, 03 Mar 2026 01:53:07 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b7713csm308367735e9.11.2026.03.03.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:53:06 -0800 (PST)
Message-ID: <3834ecc4-02d4-42ab-9a4c-075874d27b17@linaro.org>
Date: Tue, 3 Mar 2026 09:53:04 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 3/9] media: qcom: camss: Prepare CSID for C-PHY
 support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-3-e53316d2cc65@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260301-qcom-cphy-v4-3-e53316d2cc65@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
> +	bool cphy;

Same comment as before, you should have an enum not a bool.

---
bod
