Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0710A1E
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760026994; cv=none; b=R3acKJhkZgrgQgy8GUlA+eMmIw/F7WLXSIzIDqJAwkGTLCtjVi0rXnG3PDRwoDiNN52P5BfZWHNNF2AbLepVGlN3XAbldrVqNwhFcXizlAz3VSjr939IYe1LP6yielyXpEdLJWLqX3HQw28GCeOB3w4yi3frI30Kq4JZnDZ4ayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760026994; c=relaxed/simple;
	bh=E0WUp+SFGkom1xfm7TjoArjAQgZAB0HlkcaNu/zLrW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwGnI42KGyd47T85Bv/wtrWDgopD2E2Cxjc74KHua1epYqSqMTBTwRl4I/1ua8uewwKBymwADrbQmhmioBA3gB2DGKQONWpLHN3rBDa855eSJ3cZjRkELzZRmTgVhgDm0WKjvIunF3t0qTTsHyBJNZxiIjFdUCivBt8CWAHJoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cqci1QN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cqci1QN9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EuBxM022311
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 16:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bt39X8dW+ZDv9jSNO3RMlOzt
	N0nkdVf4IKuaB0k3nl4=; b=Cqci1QN97/teVcqE1BVo4WyOolpPKOXmhP86rTTe
	8ablEGLhj9fFsU9s985Tl1Z1dMi/kpDskgXb9j1AyPCJWvua/8YGu0f1PFl9aByj
	5/EkUJlKgKzkpjvV7gAcXUmxIItNXXBGbGWz9fz7pbC4RDIGLjbnJmIziaUIajfn
	XsPMG4FSEtXP2iJivh+TkgEihFQMzuyJJkjTRjWqs0f52DIhZhBsSF5oPlpzquCU
	ZjG5/RkpmodNzNLNcEuPtiYDjZYihWa+RieBSkyTxkBSjWQ+Z2JR7/LEEZA9lcV+
	xKm54IxR9QyJ3mLxjWBSX2xuc7ciZ6ql00hGMK3dNtdujQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4skjnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 16:23:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de36c623f6so41988951cf.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 09:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760026991; x=1760631791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt39X8dW+ZDv9jSNO3RMlOztN0nkdVf4IKuaB0k3nl4=;
        b=t4NoyKcq612+1g87yut1Tky28OkAfKLy1HaTybogSdR2RmgnqqLNZ945vyfuXQqeeR
         mxo1egM/LO1hb55Uph0SXRyvi8HvKwyZq/8VjhUAsPBY4dqe1NuoNhDAchdyPoLss2BU
         p1S1mlepLyl1KvsYEGlsTkkVXE9iZ3mD+1MAMCx25+2C8DCVHoOyCjo7C52+aevghzwY
         d7LgiVlHsSKRa/hXumCkB0T4BwYNUcJxFBbf0do+PWPmpUhqGHJmdHdvUtzbq7ycuZil
         ERSnWJI4y28WSLsQBLq8Qy7TaoQWM1edlAXuuSISoBYy1b3bj/QyjOEmALQmLaE+mu8T
         8ZRg==
X-Forwarded-Encrypted: i=1; AJvYcCVwx1s4BEn02Xer+yMKJOb4iX32s5gsCTSKZ9HpuLDWeyjQPSlAIUznTl6IyrZwXRZcsAEnOu1KEf5FZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8Dw20QK81sDs0piByaXaU0yOyHsuz0AYj5PR0MEXZfLobtKc
	7rWOrNw3Pald41SwRvKwXXKSKD8hSZh7B00iCut5bEBTGq98sNCVjC/jquGz808RBTKjxLJNFAY
	NX9kYfNip0NYw485Ft5rO7GrQiboPWyc4Gb5pTC8SgvdgEYbJFrSHpeVnOKRk/8lejg==
X-Gm-Gg: ASbGncsVD4eh8Uues7IbOcsqRWdBpBeWeCZFGCRZWn/vzSFpGp64S15ZIn/7qbg8sjO
	gmyW2nghrSNQZSuGxMg2Ld7p5dlZPq7EXLBKHKzRrxr4Pbx98ZYxYUVBQYZXxsWIxX4V2lxZVpd
	JnsKm9GdXOKGLqt4YyZqvyivIcOf0lp4jPWTacseMCGF+oK+ohn+bHlwE5s3O1GFty2dY5uneQc
	+jObgCVL2ubAVsOqO6TcC5HuFSQa40yLDRddf3ArlXO8YtLLvMn8B5uovs8F2N8Bg0W9XIUtXfK
	APMQNbbhLrHJfKAWdaH4r9uHOcL1XApxgP+t/LaAGBkFcF2XPl9mOAo8aXGIOW/dlbfpsz5q5fL
	yGG5mrNMp7URv0RbK3T9dOjEf+07q7AcDsa7+N2E3GN/JnV3LUIZpzq1YUg==
X-Received: by 2002:a05:622a:355:b0:4bd:f73d:eee3 with SMTP id d75a77b69052e-4e6ead54c1fmr111202741cf.39.1760026991170;
        Thu, 09 Oct 2025 09:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg801ObE8F+R8kZBeMVN+M/a5YBBI9id+lFXKMYLvZEjycOY0KP+OvFKokNNP+wtFnRV298w==
X-Received: by 2002:a05:622a:355:b0:4bd:f73d:eee3 with SMTP id d75a77b69052e-4e6ead54c1fmr111202101cf.39.1760026990405;
        Thu, 09 Oct 2025 09:23:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac00a78sm1182099e87.19.2025.10.09.09.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:23:09 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:23:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <ylnjckdtgfktz4x7tcgy5g5qebpppregubhjn23e6cx7s5w23b@7tq35tvwx2qi>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
 <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
 <bmsxmwfdwx7wlmngaqpvz7c2nudcoukspkxgq6zqh2mdlolfxg@fsdbafotp5q2>
 <75011ead-8bd8-4939-ae7b-1c127eba8aa8@ixit.cz>
 <3mbngf2r3rvbn5fr4vxbk64ouvm3voo5o2r63vg3clyswnceoh@64r6ujb5qr65>
 <9018af52-1c81-4d2d-8717-44e5372dbffa@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9018af52-1c81-4d2d-8717-44e5372dbffa@ixit.cz>
X-Proofpoint-GUID: fQXrOakI5RbHHx5KtRSkG_YhwQfh7Grw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXww3iUZ4l2ywa
 KZMMI2eTty7Zo7RPkazXt3FEpIOzSHoouDdECjJJ9pESvHxHaQM5UBsgw0rv4SKTWMR7fwygfnp
 BO45Cy5f0rUYsrg7tr1dAUAqO/jS9f61O3+Xh5X7lzlan/aW8aJhgvhnSbhqpyCqXvrcpNbkKgZ
 3U4K4fySgxR/wD2z/aNB8nvB0OwfQNSkrGoQNPzyMYtqyd7Ms/poMkvc/oC47qFak5B96EGqF0o
 BAyod/lfZS/PYVubecDDBuI/1D9EVsmQSIE8yqllC659svAoz2tRHCVQ5gUGJDeCnCu5qWi/ZyA
 jgGkRht/E0weuecb4UQQ5rZhCSylPHVF4JCC8CikTv50T/F5DbDbMK8MqJ135eF7EdGn/4vrEva
 nXpIGS5ze58Y6rNeGur7ayUfKr0KVA==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7e170 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=7einrZQClg3FUqyrEHMA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fQXrOakI5RbHHx5KtRSkG_YhwQfh7Grw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 05:44:46PM +0200, David Heidelberg wrote:
> On 09/10/2025 16:26, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 03:32:22PM +0200, David Heidelberg wrote:
> > > 
> > > 
> > > On 09/10/2025 15:21, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 09, 2025 at 10:51:31AM +0200, Konrad Dybcio wrote:
> > > > > On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> > > > > > > From: David Heidelberg <david@ixit.cz>
> > > > > > > 
> > > > > > > Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> > > > > > > 
> > > > > > > Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> > > > > > > 
> > > > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > > > ---
> > > > > > >    .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
> > > > > > >    MAINTAINERS                                        |  5 ++
> > > > > > >    2 files changed, 83 insertions(+)
> > > > > > > 
> > > > > > 
> > > > > > Please also describe, why it's not enough to use defined compatible,
> > > > > > samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> > > > > > panel-simple-dsi.yaml
> > > > > 
> > > > > panel-simple works for 'dumb' (perhaps a harsh word for 'made with
> > > > > just the in-spec DCS commands in mind') panels, but Samsungs are
> > > > > widely known to require a ton of vendor magic
> > > > 
> > > > The question is about the _schema_. I think it's fine to have a driver
> > > > for a panel covered by panel-simple-dsi.yaml.
> > > 
> > > see display/panel/samsung,amoled-mipi-dsi.yaml
> > > the OLED display don't fit well, but I wouldn't mind consolidating at some
> > > point, but since we know very little (no datasheets), it's hard to do for
> > > now. Maybe in the future when there will be more panels schemas, we can find
> > > a way to consolidate into one big?
> > 
> > I'm looking for a simple answer ATM: it doesn't fit
> > panel-simple-dsi.yaml because it needs foo bar baz, which is not a part
> > of that schema.
> 
> v3 will have:
> 
>     dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with panel
> 
>     Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
>     Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> 
>     panel-simple-dsi cannot be used because it's limited to one
>     power-supply, while we use three.

Perfect, thank you. If the bindings for samsumg,s6e3fc2x01 are
incorrect, they should be dropped too.

> > > > > Perhaps the original change was made with an "oh it just works
> > > > > surely there's no drawbacks possible" attitude, as the panel
> > > > > was left initialized by the bootloader

-- 
With best wishes
Dmitry
