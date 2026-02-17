Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5A336EAA9
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 18:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354316; cv=pass; b=j4VGcNb5V3eY9+VbUetj1S5sOHLRHotFeYDkz/Nkmp0jzsVCLcAjaBzBweeqLquEJ1RDWp7F6kFyFfI6nogCzWP3nLLA5Xqgltd/tl+I1+KAx83qxy+4x4BrkwPbjQplHEkfOWMFniLJm7sQT1U3m1IE3z77MGAWS8oj8jfRikc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354316; c=relaxed/simple;
	bh=mlaZHFNq5XRxueoqRH3q0IdHdk7o8tvxpfjKaHA7LPs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZqPdnpWeULYlXYrHjIivzxSN4OHv0wfGl+kED6VjKvMyPC+iB1bHm70bGg6llwm3cg8WFyQ2kKN4O9LlVvZf/OUARFsQMrbn4SYM4T8w7NXsHIxGS87wmHeFWTTizldLymo7mP0Vfpud3/WlxwGzs4ep2WvW3HsH+O5J9wHah/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPHBkMTS; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPHBkMTS"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b86671f87eso217538eec.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 10:51:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771354314; cv=none;
        d=google.com; s=arc-20240605;
        b=fCaZWTI3lRFWmdYh9ejaBDJOnIsKpUd2ZMY1ET4Ejex7Iv2zgpKUMYo57/bv4ZkcwP
         Me+ODi2RBMtL4wkeCLZIQYB6nNa1XRmJcOihuZMyt1Xdd+dOUg1W/somwGTlcnnXtOtJ
         rY+6ByU+l2gPjJvEdyJOUG3ifR8tC7mJNd4nipwgiVRutt/fzzDs358naLDWaK5YmW23
         Ngh4GW3+/zbrWU9qzdZcyaDP+J6IVV2mz7QTGsR8D0kO6kToVtNQNjgy9l5fluUN0/Fo
         W0r0BZ1kuMdM9cyC4pyE0YauJND7sZ8ts8hSjcXyDE5jMKvHySrMdNRXYnBZEAkn6JU5
         dpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        fh=It1WXh/fxLyRrqCVi8/duvZMkDJ8aQ9Gm9ny3HpwTZk=;
        b=NaGJlO/dmtkYsXE9i+c+ocmGLrZsvawDglo4o3+9CQpIUf1SPye9kZKmGcPwoNt1Yk
         713HrC2ubbT0N9IBCI88WcfZw48/fJ3YF+kE7hWDNdiFa/hpj6Lk74DGK9CVGnmQfMXH
         R6R1gwY7PS00VcsJfz5dVAOS63LOm71gra7UhIRv1isYXf32TB0fNjas0yOKjhpo3cyM
         Noidox87zBQMgdfawYxY80kGgKtc4kbez+u4BXTYS3FpHmsKtNuyu9+RN3GzbDNBv4v3
         M9Ha2dZtE2pmqje0WKvWNn6vUpTNKyK6rpSbg3QISkIRVh2SI+1P7eWnNz1uFlEIUOmy
         Krdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771354314; x=1771959114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        b=cPHBkMTSjsQBrLDzh0g8vj7f7bTw03oaXK9dbK4ieBzV5uV+wxGL935i4qZM2/biBM
         QE/Bha4ZjDL/9dUWLpQuPHfI8s3B/peCXQs2sDucRTrCV7+mAgqFgNpf1mp/+CUigEgf
         UxUmiEqc1OykzT5BvYjfQU4Lj3a2+DVZ9KNQXWVDV04oRxtY4l14BdpbfS5fGHcr1zMp
         sDwM2/o7ZYD7ioUiuURlKrQjqR9PaE/cif45Lm8juHfROp9KH+FeCBqpp9CNcLck1BEH
         O3ss3JLl20ZOzvb/o1E116JC8zQGr6T+nVrCn0IdtxigqnVqsLW+30+c3YsKVjTWTC6c
         kNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354314; x=1771959114;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/Dwq29TVM3lC7MbucjOF4EsI3jXCUOI1BLL/5lhNGs=;
        b=Q2WTwr/E/vg1Ik/XFGsKzyWC+ZRUDKlb8je3zyZWz/ov9hKf3MHkj0djbbAxD6ELVQ
         9RmA/ysa7XVol7UxU0ja3pyBdXQu2NEFjMW6ZoXyAKwrlHiC8nUcsZ4hFMN4KXfnxwo4
         +6NpWbEYBqHMY+ghc7Cl0h2rP2fNGDRPtNa8XybG6rWhOSm0htbOL0WM8RMW36lpZ0Ce
         PBuviC1fTkpffU6UYca4mVlFs88Mjogzyw4VFoPtmTDIoTXb1vhh9iXo6irXunldpM77
         08K2hKyaoDQz2WxLYf6YR3BQjWqhj/WEHBRh4oxT91IN3Gr6H740vI7eknoLJwKcglJ4
         dKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZxpUdYHA9Knjeej73CXi9IEg7cgze9rEUoY+Hh21kQg8bpYcmLfZCJ3Pr4eLiQaXuUalq6tpk4QBt9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvnKlN4ifuzHcOGl2xriJIzPfNEEICXhh6+UehwnHOUl5qZBRz
	fTgGK5lW5cu48b3gclLV6SZmcOuEdPCMr1z3SfhOfmQhDxFRNyF7KeW3lgCNvtwizR7/PLMG8qv
	J0CHzzmoUB992t/xtQJC6SImu96Zk1Z0=
X-Gm-Gg: AZuq6aIxiAE7oeIyHO0jIJNAqxm74UH3hCjP8TJzyFYLRhKBuxJ3vRADscitxvBT9fb
	ageUj+PXwlacftbueieq4Z+lkr9GHw6RAG0/Fif9BawAYhCV/z5/XULWVtGpFp9n3xpePv5GHrb
	1h2/EL+pBvO+YdPI/qVT2V8HvgasCmWaEejaXF2ObkgG1ozH8qnWBxyU2clEW1EyL8kU9b7NmYi
	er9Qp+NTsIVDlbUMC38HOWdWf4hbYC4kk74d7d6tNaR91lQc6XU2YOwrlzMLuQkABOcAVGReuq+
	lgxIXwpJ
X-Received: by 2002:a05:7300:b90b:b0:2b8:1d16:9736 with SMTP id
 5a478bee46e88-2babc44ed98mr5624900eec.23.1771354313687; Tue, 17 Feb 2026
 10:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 17 Feb 2026 20:51:42 +0200
X-Gm-Features: AaiRm51oN_WMS2IyaAAXhBJ1VmnFKjk3HIr2OX6Yqqq7pT9MsuQDZGKYwbAC5Us
Message-ID: <CAHuF_ZqWTb5Z7J10WQaBR2adVi1rU-ZFFTCBkHh6nNtuuCdJDQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
To: val@packett.cool
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, martin.botka@somainline.org, 
	mturquette@baylibre.com, phone-devel@vger.kernel.org, robh@kernel.org, 
	sboyd@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 16, 2026 at 08:25:20PM -0300, Val Packett wrote:
> Add the missing defines for MDSS resets.
> While here, align comment style with other SoCs.
>
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>

Regards, Yedaya
