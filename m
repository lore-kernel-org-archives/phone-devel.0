Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE6D43B3E2
	for <phone-devel@vger.kernel.org>; Sun,  4 Oct 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115152; cv=pass; b=jzbH7avKE2DeQ24IgzxIs3kpieOeRg5qipdt4wEIogCQF36iywc8HXfffixlwNBSzj2JJq54h6wnRyKeN0iHmcy27ZemtIsXFG4VWK4pMa4PNG5kz27Qc/wZoXnOorWd7zDwYYHY0Mg1cgC7Q2wJYPsIyjTQyDQbRZmA/w5mvLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115152; c=relaxed/simple;
	bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLfbbR5R5WN0LKD7xSJE7PWPy0WkU9t/+lZ4eqmQF4Dz+j5E+4QrLqKfFIlbCpsLy2CALmJwYS1p53Uw8BS+vfXAvK6hQ1otC39t86r1YxZt6dHjfg2b+kqBYp7R3m9NoRiewU99uDrG6PfWl6DyNdbXCHN6EZw1u+6iY5AqPGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqMLGH3p; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqMLGH3p"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42966d5fso693590e87.2
        for <phone-devel@vger.kernel.org>; Sun, 04 Oct 2026 04:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791115149; cv=none;
        d=google.com; s=arc-20260327;
        b=jTm6SoHGrcqmhPVPvpvRWfVGCNWV63D/SJR4CsfIYaZd+oJS3UJlzH3r9rn5TV6E8o
         9jJUd32qq+ox/XQbjYB5COwlsxTABZpPePaq3TepV5ZSJ8xGeJmsKc8oVPQpPCZlx7qm
         FITNnvHfFu5SwMwPOBJI4obLZNt3vr6bf3wsalDybWBKde9JxqzqqFa8rVZO5M62aFlx
         CKnw2ErvuSA/IqSm+XfkCvp+aW6W7ruWHXbE/FHPcqKv6oK72+JpLGUfUEZlCgO4+PTZ
         d1z4Oz3Lqh1O06cyxeKgGUT98Ehci+aQw8UP6axXNcSLBjMqhVNFUommBNEBTNNimxd2
         DfQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        fh=+UVXw3as4RVbkQk+t75my4jf3NfW8pHbDn5DwnFZtns=;
        b=Ap02MPgtE+oaHEkKSN8+Is7YkWpAuMp1MKoQXkrp66BWXuRcgDtT6YOW6roGGGQfCG
         Vo/AzYZ3rQ2gnZOiZu9qSczwMV0fDsigKLjyY6wxYveWwnbUsY1TzAhpaDwmLFDqwhKK
         MttFw/fJ7cmLj9us9LbPhZAiW9FWGllmWSxoFYvuPfIXnH/v+T+qvlGjptrscxtzWTDr
         K0M1IvMz1RhBq8hvF5BbsON5atxYzaKvliNuadop2Vhv7hQYr6CS64o9dTn3YdfVPiaf
         bOWTjov5oXJQYtFzPPLw54fwzA0zIz9S/N5UI36bb4P37RHvCRD5+noZi23EiQIwGD9o
         7FaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115149; x=1791719949; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=VqMLGH3pwV5hY7J2/iWBbwzoGS6jiCnk7KAk6ke0Y5Pbrt6TuydcD9N4g2hrXLiZeH
         nfqcTfyvgbmZBqPRYMm1CrrLcaIfG7CkPST1xEi4FPj1oeTPUkYeJu/O5Zgm6sw7oHXO
         KF3o+/3OSdPKbPOmCaRirw+/mfU4t87U+nIUcSGRHpM/cToqQHKsl7Dkh6MsqYt89gEj
         RBMvD9gosXW83TSojA1gmJ+AUPGq2lQ4g+HWct0/fzC0fm9DXy7lE/t+n+Mq1xnDFZjr
         E0pWQZzloJ5S74WqosP0opk/LVMUy6mA9UQlPVnIIuZfghh0N4ByKelCKkoYTomRoR4/
         /ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115149; x=1791719949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=f/YM0vsxib4dJnJAAd4LDrZiMPbZFuxUFNXdxbKAtCfl/5uUAYTblQpAkqlM/SfBjs
         HWbmhVlT3LUiX0il+dMXKTA7TeqpvybO4e0AtMJca7lru4lfVinE499kmhFrM1UHsJyR
         fVDg2u4o55UqclKkDGgKvl4m97lohfnkzzuFTjzPIDyJRhOuxZ32z0x1v7qIQnHWFsRC
         KcUrNqQ1QwQ3M0hAtvwI6EXsPI47sNHEKs/BiiGQV5ocPwY2jI0GY/Bbyp/ZwTZMUmDD
         Rbc/ou5CvbqxoC73pq7XYJ3LkLvV0J1RQ9zM7b+eITKx5h7NJxvdKMEbQ6KcB4DLIRa+
         ep9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2RwgI/ehao467JUCNQv8t5/nEZVBusfzfzBIOPs/R5opnYgJWxmAnijpM5uqzgQE9Z7VJZcR8Yd2jUw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLASUX7UYExa60rsdU7N8dEigw6TiBg3Cjun6LuRwod/9k59GoR
	IGv+2ltYO9FympT4ovhaLkMoDzQqX3kxmNZQhETz4tpyxSjwA3Cm4XtRl42GNyVTvSs2cGygNcr
	oxTkVYk7lvA5Fda0hb82aPic7TO9anAk=
X-Gm-Gg: AYBFou3Wu50sD97oj5/t19bmKbu5rQ3Xf+wKUvjnkBcmqZp04U9Agc/Ay9YZMfUDbh9
	OPcgW6fSttX2MaHujIldzMsEX6O/wdm6TH0X41EL3LU8rUAyW7b1UxnLA0mVyHm3iOl9Y7pl3Zw
	vRAgXHk5Ea5H9Z+mG+TknkhEwNUO32D9bxoVysTn0639gTZUT4lTPnVO+BbUkA+yuU6G7nA292t
	fm+LdbPczN/EG9+vslSCjyaYF6mN6J8I6rfEs9D2nQ96mgt3lm0Wiy/gP+KmhaOArtouR5p+npy
	5lTomLc1zHPjd8+xdyoI3tl9RovN1c5SDd0W9gTIREPGS67LcthPTXaE9Q==
X-Received: by 2002:a05:6512:3c84:b0:5bc:b8d8:d766 with SMTP id
 2adb3069b0e04-5bcb8d8d985mr953656e87.16.1791115148823; Sun, 04 Oct 2026
 04:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
 <20261003-qcom-smbx-chg-state-change-v1-1-fffaef446932@gmail.com> <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
In-Reply-To: <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Sun, 4 Oct 2026 08:58:31 -0300
X-Gm-Features: AclHuK8XfUMsTrUjezp37dJXnfrGVlkqDXrTvYsOblQTNjNZvnfYIKp_Sma2dwU
Message-ID: <CANxzQdE8tmPLweN+gfs4DdpFJXpL7ruiyk1cwNA41TL8NbefCQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: power: supply: qcom,pmi8998-charger: add chg-state-change
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Robin Snyders <robin@snyders.xyz>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 04, 2026 at 10:06:52AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 03, 2026 at 04:45:21PM -0300, Fabricio Akio wrote:
> > The charger raises an interrupt when its charging state changes. Allow
>
> Each of the ones mentioned in the binding?

Yes, both. PMI8998 and PM660 have it as interrupt 1 of the charger
peripheral at 0x1000, as the downstream msm-pmi8998.dtsi and
msm-pm660.dtsi describe.
