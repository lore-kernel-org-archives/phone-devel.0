Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ACC128818
	for <phone-devel@vger.kernel.org>; Tue,  6 Feb 2024 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707204470; cv=none; b=emhYw8SWDhIb4d3h+/8dXRzasHC+zC0meogHv7uwlia3dDPDqcwPz4qvKxqtAEuzxmDyDPUe9msDf3ZW1SNoTt6jtQHx9MWKUdCV2w4HpqSWjnJtb0qQ2P/t6Tx6NltlD4uOzcUCBV3/RIR/1c2e5ChsAflxyaf8tq1bxeVIAJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707204470; c=relaxed/simple;
	bh=Ss7J0Z4qBBv7P0Lq6wAPMJCCSx/flMtJa2Y0ZIXvQHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMFhVUEgGUlc0DUfevNsL107ODxtUSmX3frlMwfGkaTNTmkG4SfB8N9h/GlCp3kXsNng7WpA732YQM/zsRsiR1kw//XHIbO95zFxYj9N88yj9bvv7F/ZUTdXTGQv9yjYIy1K3MO3uCzWMRcesux9LG93pCUU2fhJ2FDOKsCoX0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQhlF9rb; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQhlF9rb"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6041c6333cdso43026977b3.2
        for <phone-devel@vger.kernel.org>; Mon, 05 Feb 2024 23:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707204468; x=1707809268; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JTwYss/MnnM13HyTf0vXaofwqZrwR8loiVFwU5LX2PY=;
        b=xQhlF9rb6Gi5cHsX4CTSoAIg3n8x4vJOkdnlYBWtuRsF1CPNSR3whD4HCzY6cI/Esg
         w1Mc4Y1BrfsT+7V5AS168KmLdfmZ7HOTuruZ1E241T1n2tB/T6I663viDro4pcgltETJ
         6sDuOZRb7V5q7pHrvyRynoaqaDjjU1DOWdqsrycrkjZ097T4tT1VLIM5zuKakbvl+r/h
         yryWnj9VBVcdN2eBjT0889lKhYWHUnlcU6GPSlPUfTI+i4BJOkVTwPiGV8QumAkcaFLS
         pV1vJ52DGVcoP4gZPwgwUXVjt9Er2q6OVSrj8rDZZMlt/yYDZnVeffFIPDjlB0QtOVSj
         ik/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707204468; x=1707809268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTwYss/MnnM13HyTf0vXaofwqZrwR8loiVFwU5LX2PY=;
        b=bxPyLhVJIzslP4KZ6Q1Q9O1gnZVBxJf94zfoEM1So06WuoLU81ff8l/o1qQaUqxSoY
         Y45T+q8ftTi3HzllkAmEtdrS+dWxAqXpKNHetWHk6yi2nEEI8NU1rhk/hiDM1V6Ezdku
         SsSJFuO+z8DOgaWZ06bKKnFIpSZKeCbNq+QYzBU8PuyeYLtckeC+MVA8Pmxjwcrm4IsM
         zqqi5DwL9zZe89mCxc03G994hMeYQ2e4GvYwvfqcX7dIw5FDrBNKqz24FGJawhdsOm75
         6R1PSfnOSnK1a6pIjpTlUZeRttznEXgHQ6Wpx9wJebmsStab0pu5Qql28oUVrqf6129t
         AXUw==
X-Gm-Message-State: AOJu0YxM11oocV45HP/7vCRA6bjC4hmYlNgY3XxIKro6h2ZRmenwz3v8
	GV2RAlLKjKvjM1ZQEo9ci/u0T5VNoz2DR+cwuTIZZj2kmw0LEI1UQO/KInLWt9E2NupHhuTk3BE
	npVK+5vWihDdNk0N0C68lJiC+XbMCQ2LPZ2vMJxesTzVYSD0cjlY22g==
X-Google-Smtp-Source: AGHT+IH5aZFBCbzPwOkfK/V7Pv0OlQXEJvQKSmrj7XFq6d9dhv5vj1J+OWKWV2kMYRxJQhWB7mB5XJ9vuezs7xZplJc=
X-Received: by 2002:a81:f90f:0:b0:604:ea3:6525 with SMTP id
 x15-20020a81f90f000000b006040ea36525mr737126ywm.0.1707204468304; Mon, 05 Feb
 2024 23:27:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240121194221.13513-1-a39.skl@gmail.com> <20240121194221.13513-4-a39.skl@gmail.com>
 <6e34c1a8-59e2-404f-aa47-0cab772f59d6@linaro.org>
In-Reply-To: <6e34c1a8-59e2-404f-aa47-0cab772f59d6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 09:27:37 +0200
Message-ID: <CAA8EJpo=mpEvSs_wSwZeAPvLErjkSkcMqkWHch0LC4KnuLp_eA@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jan 2024 at 10:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/01/2024 20:41, Adam Skladowski wrote:
> > During conversion 28nm-hpm-fam-b compat got lost, add it.
>
> Please add Fixes tag and put this commit as first in your patchset or
> even as separate one.

Fixes: f7d46c5efee2 ("dt-bindings: display/msm: split qcom, mdss bindings")

Krzysztof, if that was the only issue, could you please ack this
patch, I can then merge it


-- 
With best wishes
Dmitry
