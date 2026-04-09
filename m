Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B26335E949
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720798; cv=none; b=eUeYfM/OyEl35nxGtuWUt6+vTF4L6JWKc//IJCsspC8JG8Sfnt4uY/HAZwU7N6het9UGI9iAvH1RvJMtVfj583QK5xNaJggFq6THQIra6S/c1DMRXKTrUdkXkyzbEtwp3EyfDqTgYZ2v7pLhZhPZ3R2c0l6GpNbsILYhYOsYrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720798; c=relaxed/simple;
	bh=BP2KcMnRF0zVH5NvOgOE63eTVnN+q88HxTx49+dIyR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqZTqG4tzcpVcFzzCdo2FHbyZ4O8PCKoDdpzkDVvbxyubFwGGyEpO38vYssrs4t3z21lx8JXLU7uTxvDqnf6HDDisht5Xb4XVjsRjONhpT/D933vqcDPlHRBG209o3DFmdnf6nijkgC2YGr3+XOxBBkT6zSxjT+4IxU6IqjuaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3K5vVVf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3K5vVVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775720796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzq2GXPPGMC+IRIbq9cbXuo6a7PNhvIxJFbGIOX7fT4=;
	b=Q3K5vVVft4/c4bNW4s3mMgTwYUuwLw+i0o0fcJEARyhx+fZXeFSJavg7LEtMclQVC6BHXs
	bGC2In8MqTKkhbzl4/bkmjaS+89R+QCIPGj+VhpXCjvc/X6/dvTSeQbDKbgI/YvhiDsChk
	BHTpKGNtxy2D1D+OG9kaDqT5zvWAm/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-LjWHc5ogNo-3Phdeid09CQ-1; Thu, 09 Apr 2026 03:46:35 -0400
X-MC-Unique: LjWHc5ogNo-3Phdeid09CQ-1
X-Mimecast-MFC-AGG-ID: LjWHc5ogNo-3Phdeid09CQ_1775720794
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b9b8e3af6so416536f8f.0
        for <phone-devel@vger.kernel.org>; Thu, 09 Apr 2026 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720794; x=1776325594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzq2GXPPGMC+IRIbq9cbXuo6a7PNhvIxJFbGIOX7fT4=;
        b=OpxeOtkggA34JHZk8thTuoxMhhAAHZsm6fg5YwFxk4ErPsNMk74u4S0hH2ioGy8LWD
         TEqkMTdRDLWNji0PhZwvGfEIPqC7Ro/tksEq/qd0osASe4Gyb2GQjtim63YV/W/UsJDo
         1G6GX0V2qISPUw6F9o70uTSOS7D495e0sgIqc+5TsEg217lIvO81ayun9mNSn5EbWVzk
         Zy0xEgTg6ChhSPHPG54ex0R3UTqRnNnOy1d9qSKlE6D6KqHGSVqPT/TlMKxBrItCASIJ
         h+QBGF3syi/N0LZLZ+MfV/arGDW2cUNEjnMAYuTXVGkk3wnTN5ecvaqwUU5gLqYTll7j
         5aRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXESYgxSlnqTwaKa00rWGcXgiddbNd8TAr48UIvtM1aMIjhIs21ltrCbEYQVjYivDhpnb8gY2goof3Ujg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWWnYuz3mJyWF0WM5Ez7tXhifskI+pCfwXa3q3OPQj44xY08Gf
	svUEMpBQ6oCVmmAtT9otBf4c3cgY6CYPodpE+tyztYQFNHqi5jzoV/CIMjIPXgRV7pdDauTsrRC
	/JCPYwRez9rRquI1CqLkvlK1ohYwqraeEBdtE9M/qa5b550Z+8wCwWjqvTAP2oGNn
X-Gm-Gg: AeBDiesUqdotCEqAjqNuyqSgAKOeHbokf5gBxK3mtNpxADX3oEi4eJ6IYQkccF/QwLX
	vJyiNX9iO+Mt/jBkMoRH9O2BA5rv1UcMATUly7lEBzxcKRn82CSBXdzgU/FfaKDmrf6tNHNFSqk
	hG0IRrbg6HH5eWoobQQLMvUhkTUy0tnu8K1ncyIFGqHqivmazSdLeRQhhI99J6ifMjomVZaaSj8
	E5nfN/R44R/S5SJbIC9E7/o57NqIfFC8ItdO0E9v7/xGV8hlt4vtv9rja5fGx5PkzHmylXCI/Er
	w9wUhv/Dc8LzKQmJwb7Wdz+F+vK03k+lSkKe23tGuMSpfWgVMJ3bgVz2b+pvh8/pl3Zo+cCDH00
	1z4oNd8EadR5l6uRWoM8qxO3iFq9G23mzOdcrA5Zr+Dr1Vu505Ir3GoXJ
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488996df052mr297307715e9.8.1775720793992;
        Thu, 09 Apr 2026 00:46:33 -0700 (PDT)
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488996df052mr297307315e9.8.1775720793542;
        Thu, 09 Apr 2026 00:46:33 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd2181f7sm58355485e9.9.2026.04.09.00.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:46:33 -0700 (PDT)
Message-ID: <48464d44-1fac-47a2-839a-c963e9421615@redhat.com>
Date: Thu, 9 Apr 2026 09:46:31 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] IPA v5.2 support for Milos and Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vWms-4gKm0PD5s3svcueILRKMcZAWhJyfWt7k2yYujI_1775720794
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 6:43 PM, Luca Weiss wrote:
> First, two fixes that unbreak IPA v5.0+, which can be applied
> independently.
> 
> Then add support for IPA v5.2 which can be found in the Milos SoC. And
> finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
> starts working.

You should have probably split the series in 2, with patches 1 & 2
targeting net and the following ones targeting net-next. It looks like
patch 5 needs some adjustment. I'm applying the first 2.

/P

