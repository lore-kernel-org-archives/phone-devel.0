Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298BA23EA8F
	for <phone-devel@vger.kernel.org>; Sun, 19 Oct 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760875915; cv=none; b=cF+s81SxF6BCqJt4uVp0nA+1BLi0Q07ZIHRfPjrygrM5agcFJSvb06f4iiP1wxR3j2gBzBj9ms2NW0CIAmOpa1hjzvgshJHeqRFoiWkzbHxhLOBa98Hqi8xyxWlp4X7x9FuHMxm+ySb3z9GpmFAwswb0VRHm4aGQ8KI1hUjrTq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760875915; c=relaxed/simple;
	bh=jvznlM6D5OFeTEFwMN+wEgRK7LeLJiu3wj1O/umiVSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRYEmQLuzX5lOhXyBY/G4ZM6NKFkuHTb/9sWcdnLEVP+x/9jH5CjBVT3lgZC33ckTAPW+E7c2o/pFQx+1f7OdZsDtV8gOy/i6ZJyTCyKNhoVz7Td9MCV1x4ALAh2p1VbR76xtKA7rW3wowAbI4NckCfjdRAF0SlDo/PqRdXt9KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8ouADzE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8ouADzE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8N6vh029177
	for <phone-devel@vger.kernel.org>; Sun, 19 Oct 2025 12:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FXakmNjNk9hILrNuLbMXrtpa
	gW3k4d1NuiaVjYCVt/0=; b=g8ouADzEe0zM/uNAVtVaconF+XQLNz+dEJWtiayy
	wZxGiZVX74GKQFgaPqUdiyjOsqx9Q67CLBNMvO3UZU3IxvLpIB9yUJ2you+o4zvr
	HTBnLtyiVb8GD3v9rTSx+QfOyb6UlW4i+KzQrY6CvsLLMPKNSni1LjiQmPcoYyH6
	GmhpYg7qy28ZubfupYrrFfUeX74bL/p+lX+RBANpLiQ+6N2xa2ZsvBOdKEn16Z9J
	3ujNlM5WqFj2bWuSfW2x2irKnhIDL9n/BzRr2jlIrqMBX3dnjL9U0F/xb97u9WaJ
	zgxW9W5fzW9mNnw/w/3eybvl1zxu6NmD+LXTBhBohKLgFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7tdpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 19 Oct 2025 12:11:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88fec61f826so1081035285a.1
        for <phone-devel@vger.kernel.org>; Sun, 19 Oct 2025 05:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760875912; x=1761480712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXakmNjNk9hILrNuLbMXrtpagW3k4d1NuiaVjYCVt/0=;
        b=BySifP6J9DFTTiCyCvE0gaJ8rHty2xCEg3/8pVHj30ebRvA18do6Ap6ZoyVOXh9/Yj
         9FWKDY/6r8Fp+f9+VUTqRdZczcXDrXIYhiigT1g8nQrJx37w9yhCdBZGNRaSI125JgxS
         kea1aVWkfhJiZ6HWSafch3Mkgm3n2PJ1RP+RaDeEA2XcUonW57rh9Cl8yurUMNTGeGC4
         s8Je55nDRzTl59+f0q0krt5+9h4z+4Yz6bg4xOddsSYMhrZm04FyguNPrtJaz2U/HpBJ
         X8t9Qe2eb4+CHHLcBfG96UQ6GtOlCV8HI/+y7qh8yBYAKvAS1RzXBIfdhwwuVmvfnrL1
         MyQg==
X-Forwarded-Encrypted: i=1; AJvYcCVM8hF4LJ9IQM1j8aPwEv+gYQJqJyhFjUHonQ76lwg/hOv8vJIRN5GvyW17V6/y8HrngS4NnYMU4VSIUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTt0OwHf22/kVtzBufiY1y0CeM2q9nfCik7Q371qMsFSkBBxp
	j4x/HCy4UHACgR8FTqsfuuKqfMR7X9QzV3t+JuadAYTmQSTWkZ4gE/iUrFMG6zKbhYmAjqZNwZe
	tQbRIfDV5nnr1EpkOpanrMnzSMNPQYSDAAfuC69EocZwFDncjDOEc6MU9pOHh0mp1bg==
X-Gm-Gg: ASbGnctd3T//s5Bqfa8UK8ynOesIuW3ZGhja6lrUhDBBUE1cWn+Ll7o867OLhKzeo6N
	nMU92Tr09t+mlINOtKNj8lc0LxnjfK81sXa8qMQUzHkn5geyaTyTrI+PbxbtI6WyF+pt3YHmhVK
	zP79Y3R3Cfdkm+SOn5WVoLdqsq9fyjPllMx9J7nSipzW/PsQKVl3EJQ5AD7gnXh8V9ybYgo7Daj
	G0q3EQAnqj/ZTZjKjuBi+0rZSeA1wpSG3qAKQe6ONjhjYjfvae6E1qeI/s0BK2JqP6mIEimlk/U
	PqPgi5M1ZiJMkN0VH6M3IGRQCqxBAqGMwue45phOqqYJOm8ArtshRogaA6Po3Qw0N97VyzLtQL/
	bs5dU6R6Ttn9cPDi5oFcO5J0ijtexWu5AxltNkUv8sIgwlBGo9G98ifj+W9ip7ZkUMC0ilKXJh7
	wpB0DK0vO4H6c=
X-Received: by 2002:a05:622a:5cc:b0:4e8:a51e:cdbc with SMTP id d75a77b69052e-4e8a51ed369mr89145101cf.43.1760875912131;
        Sun, 19 Oct 2025 05:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQGIvBCD9sJ/M1qvRjDaUZ1+T6tRELaWa2oMHhW/HyBqE/0fYTWTtclEdazefvpcZR2v9Ysg==
X-Received: by 2002:a05:622a:5cc:b0:4e8:a51e:cdbc with SMTP id d75a77b69052e-4e8a51ed369mr89144771cf.43.1760875911633;
        Sun, 19 Oct 2025 05:11:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b7111sm13663761fa.7.2025.10.19.05.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 05:11:49 -0700 (PDT)
Date: Sun, 19 Oct 2025 15:11:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <32iy3k5aq7aiz3juq5i2wnnidsmbde3kdixlkpxrvgv75573ow@ebo3pi6kbr6n>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
 <didkbltadu4ql6xcqtjrtf2iguody5bgy6mqlwtbyfgbambaii@mzofzymnfbju>
 <d13cdf83-22df-4a24-a711-2db4abe3a0a8@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d13cdf83-22df-4a24-a711-2db4abe3a0a8@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXw3Qv/lYShsnz
 orxxcdqPJJ3DmTIfGzr6m8hYUNjdgRQqk5J+6c+AJl6LBFjMamHrZl4ZyXZoOJV89/ZftNg6K3S
 /Yzd6R4F82thVmJvrcvzBV5JoHxYp1teqqDizivqjd7T3cqyi9E/HUtBBN9u9bW1sica9idxRdK
 kdLP9jcFuT7RWtFo9R14ZRey/X1OaFjjx7f5PI9XCI1rO7Rklr+r/9zFZ1Q5u9Pw9zehgLKu3Py
 5Rg++54FAwTmAcr+j2AUIJnCAJDagjIGkxIe5rX+8kjxVf2PN/gLrHZtRyg/lYQ0pMrGa5zo/xf
 mdnXji+l8E0BSVwm1iuZC0uhUAkMznHegE4JoncC8maQM8rD+Gl82yBfE9M12luwOJtnUPhGd8h
 /0ADPmmS0AKDJbXlX4rJi8Vdy2hkLA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f4d589 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=yoNOsk6A1An68yMDdNAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-GUID: iEyXIrcSSz5uT8SpSWN4MF-rTjdJqNlp
X-Proofpoint-ORIG-GUID: iEyXIrcSSz5uT8SpSWN4MF-rTjdJqNlp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On Thu, Oct 16, 2025 at 10:46:56PM +0200, David Heidelberg wrote:
> On 16/10/2025 22:12, Dmitry Baryshkov wrote:
> > On Thu, Oct 16, 2025 at 06:16:59PM +0200, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Add panel driver used in the OnePlus 6T.
> > > 
> > > No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> > > 
> > > Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> > > by OnePlus 6T device-tree.
> > > The reason is because DDIC itself without knowing the panel type used
> > > with it will not give the driver enough information about the panel used,
> > > as the panel cannot be autodetected.
> > > While would be more practical to support the original compatible,
> > > I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> > > 
> > > Based on work of:
> > >    Casey Connolly <casey@connolly.tech>
> > >    Joel Selvaraj <foss@joelselvaraj.com>
> > >    Nia Espera <a5b6@riseup.net>
> > > 
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   MAINTAINERS                                      |   1 +
> > >   drivers/gpu/drm/panel/Kconfig                    |  13 +
> > >   drivers/gpu/drm/panel/Makefile                   |   1 +
> > >   drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 399 +++++++++++++++++++++++
> > >   4 files changed, 414 insertions(+)
> > > 
> > > +static const struct of_device_id s6e3fc2x01_of_match[] = {
> > > +	/* samsung,s6e3fc2x01 will default to the AMS641RW mode (legacy) */
> > > +	{ .compatible = "samsung,s6e3fc2x01", .data = &ams641rw_mode },
> > 
> > Is there a need to probide this kind of legacy?
> 
> I don't know. I don't see the need to provide it, but I understood you may
> want to have it. If not, please tell me and I'll happily remove it from next
> version.

Since this never worked as expected and there were no DTs in upstream
that used this compat string, I think it can be dropped.

> 
> David
> 
> > 
> > > +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> > > +
> > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry
