Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D39D32692C
	for <phone-devel@vger.kernel.org>; Mon,  9 Feb 2026 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678364; cv=pass; b=imyZE8wCHd2ron82q6LHcWOS+7mebq3yX0zP8nI4wGQ0xt0/QED+pytLYlF76ap+lNzl8+Va1unEMBKvjl+YTMfwPTGYeRTVy9ze1wmYRyNPstnVv0pRVkIKIy6ztbzsvBD0ucW8Pp9Ovz5uOM1izA1CMYZmikcnswwkBr9ZQD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678364; c=relaxed/simple;
	bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iW1L/zZ18j6XdRdziY9O57oWdGsig5tBWEL/QxlpiTX2pc1zN/tEcxQSBX9YItEIT8kGSsRUhp02NfCRHVroc7Gim98Qhps+IOHujlFD7aRv0sqKj4A/3UAcOgpOov6/u+Gja7E4mn+qb/Z1DTkEbDntpETfFueZIyzwD55wGpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ujaqc37d; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ujaqc37d"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4042cd2a336so168371fac.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 15:06:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770678362; cv=none;
        d=google.com; s=arc-20240605;
        b=WcHpUKgomMYvaO1KL/n7uhyFiHLr62Gh5ir4t+eER4eCZUZ/tw2u9vx6+CVDKSXAkQ
         tXbP7McffWkDqsanpjz0uhHfLS48KvVvFzc1D+wxqpT30GWwRK6K7/opqk1p/XyYilpA
         IfvCWZ5QQ6RIiKsul2854a3CIQb5/fRY0cmNVyy9jbDN4j79Rj1qI1RxLkThJdug6tOQ
         DdEAK11ZIm1NLMPtr0PhBCS+86g7hQKBAMVMEzhRETXbgoV5FDYg3FlEwUd8cIGeO3GZ
         jGBQOKDPsrdSd1aszN1c7dV+3x93bm+rOzipCCWoBXD/59ORFBivX6tNFbkSWb5Bw6b0
         vFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        fh=cogIndV3+NCcUpHsIn2FzqeNGnAFqAq7muaxu3M6ex4=;
        b=DZ1dbOkXZHl9hQ00SW/FI0DJrLDRv5ISktuaaLLf/gRhUT+MZ8LZOOltqfXGYhP4bB
         VqzS7yJJQkb8N4C1XO87JzHXZ0fP3Cs7UZ7R11TAokqJMdiRg6nDsO2M9O/J2bvbvNDJ
         gkGnTRPXkUMjRKYzzRc1Ca6zRg9s6UE+6VPd8rBneTr+ivd5UH53MHHCi7kfpfag8X/P
         YYZ+qEPMbECDxxaGND9wsPo7nK7Ej3EvejjYvgExHxXIV7gbx11+vtvfTb/DOraHdsTc
         0FgyX0+qOXuJOmbI5K4EyvXL9dtVfepBHYM7LPflSLBZS/3AKRlKYVClss1Thyj8DDyz
         cd8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678362; x=1771283162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=Ujaqc37dnQl2R5Yqj26hFvHbjrkkVtvv3gWCjC5Ecr1+WZO3N7g4EBLvZOP54cVaY6
         6x62DGnZb6lzyxmjWD5HXAEoTSCqmxUR5oQgQ3gSJ4wp+EF1bVoAvPyYYAx6zMwz1ixz
         FVbDiYe4M7VG0vFRbcS2WNe3kIAit/yPe6ANQZPeoUl8kIwt4IduA+Ag+HKUk+uWMHjs
         krKywhijR4qDlElkHf1/eTVzbJsb6wvpQ7p1T8Meb943tOCUUQYmzNd8dl6vWhvluWRH
         tHWbMnSeQvIcZ7Bi3NUTVxF3F0tuyULOROVqr138baNClehGQeHbS1OWvu1RfityBPdu
         LHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678362; x=1771283162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CMr7co1DRh/RKzmgL+sf0SpJ+u3D9obkDjv8ZFp6L8=;
        b=ajB+VamRXCnZsIy+gabZNIL+5zBoYx9FYSBCIiJlvboOIWLUhWZUldH53FM0PRpitt
         VlZbGR58u4G6FtE7k31uPSFdRD5QMnCG9ca+zEgcDyxZ50hRnVOfm3/bdnyw0B5pWsu/
         JEldPgM/jIRo9WN8S1rAC61SDUYp5bfaaMFD8NtcnuVkjh5vXEjKasBYf39lXg6PRMfk
         5Ek60airS8tGJkfoZiSfshp7etcmcYQ3Sfc5Pl4UL+YTnv17pK0I8rZxMmmEM5EmcBli
         zstubo4yKKeXjk0M1Sh9sDvEFKHJFQDPK9O/EfVQarYiAif2GKymNGl5DZ/xFbw818V8
         UFoA==
X-Forwarded-Encrypted: i=1; AJvYcCXLYGOyj7yib4q5D9EBUtR+/Mw+OQ7xUaJaYAnIlnwDgcQPsaMszA/D94YEDB4KI7jXJ9YL+LKlId6E1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+rJ7Nsh8OCWtVMUhh/+oy5aVD8WDsGOpLsXg2OM5HLEhWZ6u
	0F1045ySWxRiT3HqAflD3B9OnGyhO13uwbz3Q8a4Mu3w/I9YQrYQbxkaha1+92Ycr5bIYLCYesq
	BAD5IDe4ZO/84sfX3IfAZiYsdrehfKdQ=
X-Gm-Gg: AZuq6aIvf0diF69UeVOq6qVp5slyqGO+iaudcANDqcbABMZXu1rMa96Qg6MNPKWyCn8
	rXRkXjM9+wO9g/txMp7gI0v21ye+GSeVw8y9ba7ykQgwfHhM0ikO2J5kMRzQARQCefRo+pgUfvr
	voM34KpBDAwG4aKhPGvXeHk87OOSKNoFwxGOuYBQ316F3OTq3j74trXz78LdwOHo+DabmwOajN8
	W03+Ga1vwgRWTxjqf7wLnx1UY+ac+TUAhrqCvEgN+vhpHKANJKGwVLbgntQJEc9rT+N9/K2qfC2
	hdK21xQ+TWZ2F3HvQfwbsimsRfI=
X-Received: by 2002:a05:6820:1514:b0:65f:6994:314b with SMTP id
 006d021491bc7-66d0d2fa708mr4985297eaf.76.1770678361869; Mon, 09 Feb 2026
 15:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yoann Lecuyer <yoann.lecuyer@gmail.com>
Date: Tue, 10 Feb 2026 00:05:49 +0100
X-Gm-Features: AZwV_QjCJogYNxSx58S_93uDe6N0OJjkbPA74xddnic2w5pObERjuWLWGj2ZiXo
Message-ID: <CAPZXbJmpAZfxFK9LKaS=wZXX+pez9j5k3gjF+CRPgP6Ru4DuRA@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: val@packett.cool
Cc: andersson@kernel.org, barnabas.czeman@mainlining.org, 
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	justinstitt@google.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux@mainlining.org, llvm@lists.linux.dev, 
	Luca Weiss <luca@lucaweiss.eu>, mathieu.poirier@linaro.org, matti.lehtimaki@gmail.com, 
	morbo@google.com, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, phone-devel@vger.kernel.org, 
	vladimir.lypak@gmail.com, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
>
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
>
> Signed-off-by: Val Packett <val@packett.cool>

Tested-by: Yoann Lecuyer <yoann.lecuyer@gmail.com>

Yoann
