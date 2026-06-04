Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5363264D5
	for <phone-devel@vger.kernel.org>; Thu,  4 Jun 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589094; cv=pass; b=NQCM/me3CnXHmu89cfU2dWuxJeWhdrWTl4wMLJxb6HFolbKZWC5zwcS7q0DQe8WN/ySXo7P2EEo0AbgZfMfaKWo4WVPwYR03dgPEcdfKMn6SrPeTrotAZuVq+fTfgjMAxWWgsqHIFjM+9mhlDhAYnk5ej1TSEdnQoW5G1lIo3rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589094; c=relaxed/simple;
	bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P/xBBMAKZigGyBOrzlcSMeK8aO7YKYL79fY/T+nq+3KEwk8BHhAF+g8CUn+ruTxzS7miv2mlAEhyJUUaxI6Ze7CA6EYCAvIGRFPe1R6H3ImLdW3F3MuYZgxWO/yVDUir2CmRZZIJaE1lKteORfLmJB/RHC0Vhfc3lT2FzY5bnDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/Ic9GRL; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/Ic9GRL"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59ebf30a91dso319070e0c.1
        for <phone-devel@vger.kernel.org>; Thu, 04 Jun 2026 09:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780589092; cv=none;
        d=google.com; s=arc-20240605;
        b=TB6Looc/kqqbrgx38iIw9PeGgNtaeKHMBvDYKysibu6/YUWEOvVOAvbLVMKcaDrYa6
         L60yqQMly1aaTwRjaubcvtFMq1ZKQt6lt8WsYf9zRFxnGp8/AByK7gtEnDJwJ4AkmiW5
         cev9CPaW/1F0qtPC/HJsNMLlv7Y9EbOWZEJf2tTNvLWsmqwBwIl5DGmRjNdbhzyl4XaY
         CJF84jJ9FfEuJGnhJX8nrTUCETvjtzggc02FGUgzhj+7uSUL3dYPdWCMZRtmR93n50Oj
         W7qrUmUo7c7HP5z9l/G9zEf9YvwCaUY78zef5DxYib+U5hY6wsBGgu17t7qar3XIehrW
         Q7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        fh=lxaQjpCi/INUXivoh6XI9oblli5Qlda6RKZpFB4RdY0=;
        b=Ny//Kmfbd9ceSex1RUK0E4gXKpy8jZfrvr4iK+suXBm5TIllWVzQANBwtSOCII2SSd
         XZgUolqVwSICLB/aw86RC0WpCVW6ZmB+BTWHeKy9ynDgLY8C8SutCwvWZngQAPsH/2H4
         M00E+R1pg7TTkAxmsQolq+murroK2Ser7bzRrtoFaVAL5nWx3sXEMhcZwrc+gWDRCeFY
         Ijj10kQK02TS0XiJHXTxF08xYd2mp/pA5/7aKEnUO+s52FT//5ERhYWkyXkTStbicKt6
         oOAHk6M6sTGt8ZUTkDFHadHnndfESot5aWV9oiHkRWirKH2YfJkraMp+1gHIlPVfXYLQ
         F1/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780589092; x=1781193892; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        b=F/Ic9GRLw2ZiDd2BfCsHySJk5k3UegqtdFo4nB0vXjEFjTYFUk8bh2AAjTVYmSdfNV
         tHDXq3oix4wQtkVokOtmjsnb5uuDvZUGfr/Z7ERS3sRfKb0jYZk49LS9xT4m9UU0tL0H
         M7KFgvg3YM5WVKthS78b8O5iSpu4PBsOfcLShNEvAjp07ruXgIhYsl6s6wGsWGry9A/g
         P4dBaQ0iUuC1MMgodcYBFnmnaocFJPrritWvDWBWEiqSKERWLAt9iF3gOpz1k4c959FV
         4WRC1xwWJfbxpR/HwBw6tDMVuZTK2WV3X2M/GV1bbOq7xlW4+kwj/i1CE+WcoMdEWlxA
         CrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589092; x=1781193892;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        b=p/S6W8+d5a4x1ZOPOhGIcrNzcASbekxnq7HrJrJBIBB3ypok5QUeOq05hKawJhfuIS
         ntkca2xEO1pMKZueZH4Y0hFP3B0sHvj1hFzSZFk2OIQmoxX6gjDedUCScgTgPMMzZSMB
         VRB5+bTITrL2ztQDXNu80v76AIRlu2OWTEq4UIW3orYaZ37ay+2yJRHyEWIXD9B7Z7VY
         1YJnuJ9LIADG59RA2Bh4K8MqqyP+9P23h5g8gBrvvfy7spYZFS5cLEYymgMw0WRUuIm9
         KpxmFbnqLA9kD3h4LPjfORgv7Gx4zL296XoJPNu3vnKVXCJtYT0wYMgvZCZeIRIU7RxJ
         ZzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ99KRkNYuQ+rVVddOzp6OCckplZJ4pfxZyqrayGLAIspspczGHZlW28Hf+Fsir0tNgbqy/Jmrl03LCnGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdgxaz/tWgsQoHhBNqgyukLuOPsW6kftyKugUYviM3S14hIqj4
	HxVOI0lN9rqwkWsbx9258oGqlrfm5VCk/Y6XsIFnn96piV0ZqJLWPgRV9DVGNPw6Ne/sePFIXHQ
	QtERAJdrtqAh5fUXEyQK3qzyEcWpOqoS71zfy
X-Gm-Gg: Acq92OEHyJa8tDkWr9GnwiX2NaOXE/qT4S7YRl2ht24RBzSLqp5diR1qqpPHd3CfNkI
	d73u7lAHljMIuxMTCG74riZkaZC9q++eAgspdrXXV8zor2Laiuyn787AfPe9fdCZTQ/xSxAEhwI
	JvEoPo3/ZqwRTTa1JW+w2kHKk7ZAIgg2CK5FmZHmX2CJ/GnY/4GacK2SPxYE9nJTDR8/nlj/33E
	VB05m+tJ8l68sYRPRmTsdsUOO44OeZUjmO86rFhXfdXLSNPjhC30BDMez1BOBoyavLhDPf751gZ
	AkHXY69o7g5JJNx8O6s=
X-Received: by 2002:a05:6122:829f:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-5a6e8b0d0f6mr4956435e0c.10.1780589091435; Thu, 04 Jun 2026
 09:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 4 Jun 2026 19:04:39 +0300
X-Gm-Features: AVVi8CeP15rSUsk1XI2OXrVWneBp1BIu7jE_glXWnX0Ij_ztSucqY3e24-FT7Rs
Message-ID: <CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com>
Subject: Old patch version was applied accidently
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, an old version of a patch I sent was applied, presumably since the patch
series title changed between versions (learned for next time).
Can the newest version be picked up?
The patch that was picked up:
https://lore.kernel.org/all/20260314-panel-patches-v4-3-1ecbb2c0c3c8@gmail.com/
The up to date patch:
https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
The difference is only in the name of the compatible (O to zero), and
the updated
compatible in the driver is already applied in next.
I don't want a release to come out with a wrong compatible.

Thanks, Yedaya
