Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E27936AB4B
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469223; cv=none; b=ETHTYFr2cdFRp1+8VXxwjG/jWmwxDJ7RPrdrJJkJ1+xIHbG0GkkNTQ2wVKFlBjPnK83IoSkmoFF1kvptHVbmpGgdnLJIGIJUxnFKgqXH1tjXzjAVCQq8Y69dUeQF8p9W7PkjpIkG1hl93jxQtlh//kxkw9JtPG0NMZfwlzODVkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469223; c=relaxed/simple;
	bh=5ulfi4KVHnTTJuE7UV0uwZLQ3Tq0/UAGQR4Q6zmwnKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2QLlu1nJD/HRgzjO4A7Yrr1fD3DvnOVxwtBd1JoOj00ReXUirkc2Sr5RmtZXPUafgU87NVBuAyLRiMKDoQB+TxZk4Narh1dg3NsoBjLz+qtOILw7LbRm/I/tPvkWWCCM8QbcdPGWVmyot2yOcLsSprNf0saf69qAZQ/xXUF4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mo/mJRct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bN/ZEA3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo/mJRct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bN/ZEA3E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH5sm265576
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 20:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iqqLnvToFpREO2Iofc/xS+E1
	0uwwM50L3x9HSlvOeVg=; b=Mo/mJRctKTzLh5aZSmjbg+V612DJe+GOdPr0732q
	3n28lO1qqal5KCY/5/2/rubx0ueaL0cA2DEakGMMes1+51CCWFwYHfYPvFKtb6mL
	a18plIammyJFL2LpnUJjZKqHdr6FPawa7BKlYnf0bAF25i7Ys50c7FrmKwVDE/L1
	pAldsigQB+GOFgfvXgqsKEiq5aPPgfIz98bpM9Ecy+0kuZce2KHNoD6PH1659VeD
	DqfYHmf7As7/ATFCSSuQGzraXMiNe9N/rHxFA0UNARq++r3L+sjA+sgQA+16KpMT
	xEwCtJMUGCNYA09tf3BCWTD7tsLQj2voTliZWaRk90Q0nA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40ravrps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 20:07:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b781542c1so7697361cf.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774469220; x=1775074020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqqLnvToFpREO2Iofc/xS+E10uwwM50L3x9HSlvOeVg=;
        b=bN/ZEA3EtgKEjdsVflvQeDbyKki5LWafiuoScpVKhXELw4Fa8hwMqCdlZlpdHjl3NV
         0HSwXsIBj9Yj0D1y/5yH4Tf6ao7T9ZHN/oPHpW4rbWQHYkZSly0i/EO6LGwpUyJf+LNi
         Iq/kjr8IsyJz0Ewi75edPx3pZ7THCcNhXtVMzYjPB07HRKOBThzBr2agmNYj6XJeYV79
         Lx30pn4HzwtAUm2/4RZ37q9YVAZfu+Osh1xJMs9ZlXFmCJqBfUPyDBLqXOw1EIDZw1AK
         a1Qm/7I3YmJtiKkpdzcg2ILk9rwZ4S1H6udTGoap7j+nuklRnZhz7kfm8d66jvM6lglp
         q9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469220; x=1775074020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqqLnvToFpREO2Iofc/xS+E10uwwM50L3x9HSlvOeVg=;
        b=JJoyyRS6iOlIJvhpFn9YdfVAQmsYcqq2R17E0ojfHN42BvfXfRe8hlTc/deSsOD2mw
         R+dnSEpxk+laD4lvDKMZceEKoYCJ78trYcxhzVVz1a3XQ6fhc+ggvN19o9SDJAAvSv3p
         9XTenPwWYXgkYEyqF0F46H5Dn42V1N/JaxgYvVdycxOeKeKMy9/yez9qCOGiEHRSB0kb
         WLZ1LAhvfJnbU82HsAcsIPjNbn1IQOY1DDK1s82he0cueB9Aame7zvrpVZfUfBVrGpyp
         682rPKwjD2b+Di29sTNUaSMpRx4G38YJx0DCxW/YnZi+lzlGryqhGed1pJoRoWgvrfDY
         /x0g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7In3gxDJlHEHbdx+oNmaCt+urS/L9wwlCreTUIV+o6EfdXWj3q4Qj1Cd2W91/pDhD1kSdtdMxHXFtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ovYFgbS0TPynEv1XoLsOSfhd+VapMdyOBx+KMC3Pc24vjQDt
	owaqJrNVUMSgVjlGGY6k+DEFdXF+wW8jTwby4aIT0z7AiHPRS2ONdWgO28FlM5O/awckyroKywb
	IudM9v8DIS9qjlEZzuy+8bSF0hbKrP4gicSZFXcBGU7srfNWpVs7NbREsSebwYNO/0CjJhi3Sig
	==
X-Gm-Gg: ATEYQzx2e5MK5BhHirei/PDUtRZUnGI/G6/n3/dsaftKEt3lCiUJohGg1vD8FO1D6U3
	TnLHVOlFCpJ7oIN2dHvV7tLCjZsy34krMPTJTGI1HqFofi/t8o2rFIbl1GHDMEACrPPox/AL4mF
	VShtVJOkt1YCguXe0sBmaeDdbEd+o7x4ZwE3GiKHgwQ6FX7hWCw5oc8HER6TkVmJumwUrESmP0Y
	z+ws5GSl2eBX7QlsQ7MYiOoO0+iUjyzmecBfgbTgcWSgdKkehe+ACsBQk+G6e44Z0AmUnOFL49H
	kR4Ctef/pfN0ap0Quh/IeaIWOiCZOFXKX+2kClkljiF5l8NJisZX/Ac0L76nhR+19QJU1mnC7i+
	T6DkxsglwWaXnL9FkBgg9uEYjc/tjelP9JyM7JW9iZZBibcm10Q7OY1wFSZhjkZLWpKUs9eUAyx
	Wmug3CtImdiYo5IctCILRIPBih0dNQXt0caP8=
X-Received: by 2002:a05:622a:1f06:b0:50b:6cc1:38b7 with SMTP id d75a77b69052e-50b80ebf459mr65956161cf.58.1774469220098;
        Wed, 25 Mar 2026 13:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1f06:b0:50b:6cc1:38b7 with SMTP id d75a77b69052e-50b80ebf459mr65955851cf.58.1774469219478;
        Wed, 25 Mar 2026 13:06:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063eecdsm107879e87.8.2026.03.25.13.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:06:58 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:06:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Message-ID: <6yrsr3fsmg43xad7oasye4deankykwxef6m33ogypaeykclfyn@ws5gj2zydyyz>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
 <20260321-rimob-new-features-v3-1-d4b8ee867de7@protonmail.com>
 <sdcfwycey5ykhn2fghun7imx3tjtnwat3ny3mut5dwstl7wvw6@maqrzlycwdn5>
 <GF8zsK-szOM98Ck2jznCOZ4xjuJTl9g1b0uPc1N79Dzf7PNzOiVgewdqPFGjqF3YD7tOUa2tzdc7rG_e7iNH8yjHOJ9DobsihTxRLUk8EL4=@protonmail.com>
 <fh7rfswcwcrquijgjq547b6jjuq2v3wxiweh5xnnd4z5ql5n7r@gt425ujkpctu>
 <E_O40YTvp6FW2yHa_lQOmzZwB1BZ7r_uCfh82T3BeO-SLK255eefzThCZDYJ2PFi3Hlnp3JXL7JWrlIU2ymh7m68wkNMTsM7jcMa8XxuxCs=@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E_O40YTvp6FW2yHa_lQOmzZwB1BZ7r_uCfh82T3BeO-SLK255eefzThCZDYJ2PFi3Hlnp3JXL7JWrlIU2ymh7m68wkNMTsM7jcMa8XxuxCs=@protonmail.com>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c44065 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=fnGvSGuzkqCyUKXIORQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sIvy4Pl5iXz__bJgILL7xja5Pb2dkexE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0OCBTYWx0ZWRfX2CNuCEU+J5o3
 QwfRfwID8EDEzhvVR7/lSbOIC/M2ptf6+U5e13dtmLv9hufAAp3dINFmEdmtdwTS6e4/kwtdnh+
 aLYzTVkBUaFtJqGtfHkPvNql2y+uZRmWxjwPdAQbg2bDra3YWUVr9GDPQ3JIWc9a+5ZZ9vKP+4B
 4NpzU8Wt7sHTEH6mqhi3Wpk7b8OtQnih3HecfbIAPXuUMkINGSJHon+oC0+++7MmlAlaFSPYM26
 kZXZ0zX8MhwXw3kH7L2y6fiw4nXC8OpOWxVn6r4ueBWHv1cEecT2iRP/Uz/CouFmzqhITGkQDZ7
 cr4XrD65Q/nJ5cyvD4hCU0V6+zty9cOHfV8pr7He4WgrLmLRLSfWonBks2jz3kIoNJ4BiqT4Pbz
 z1GLllZSfD9473a/SSFvG3YnUAq5Lx2Gc9+nG2JFsb26WrimLHK6glzOjlQWH17RhX0UM2RCdN6
 lNUeE6Uqn7fbc8d4rFQ==
X-Proofpoint-GUID: sIvy4Pl5iXz__bJgILL7xja5Pb2dkexE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250148

On Wed, Mar 25, 2026 at 06:31:47PM +0000, cristian_ci wrote:
> On Tuesday, March 24th, 2026 at 23:20, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Tue, Mar 24, 2026 at 01:10:13PM +0000, cristian_ci wrote:
> > > On Saturday, March 21st, 2026 at 17:46, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > 
> > In the lack of any information, this is probably as good as anything
> > else. Please describe in your commit message that you don't know the
> > exact vendor of the panel (nor the id of the panel). 
> 
> Ok, apart adding a new compatible ("flipkart,rimob-panel-nt35532-cs") to 
> dt-bindings (patch 1/6) - leaving  "novatek,nt35532" as fallback - and 
> setting that to panel node (patch 3/6), I'll have to change (patch 2/6) 
> too, by renaming nt35532_on to rimob_panel_on and so on for nt35532_off, 
> nt35532_mode; by adding a new struct named rimob_panel_desc defining 

struct nt35532_panel_desc

> .mode, .on, .off members and moving .lanes, .format and .mode_flags from 
> nt35532_probe to this new desc specific struct and by adding .data argument 

I'd say, keep it simple. Move just let that struct have .mode and .on. I
think the rest can be generic until somebody needs those.

> to nt35532_of_match. What about the other nt35532 functions (i.e. nt35532_reset)?

You don't need to complicate the driver, keep the reset as is.

-- 
With best wishes
Dmitry
