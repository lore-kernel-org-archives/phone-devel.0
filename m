Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E8F39A078
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774899522; cv=none; b=uGEPk6oq5u/USpwPF8x03u7xGwVQ2uvIQLsXLBXW3SR9YB/gzMaHFiie+xxai//GuChy82BuI1ynlGZtkCN0Phg4fLdEBD+2P9alRclne5DDIXoo/XbdA9zJrVDP/KS9d/MhHKvi0PNCp1gO2D91VJnEgSSOXS5EW4+sEwWUNIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774899522; c=relaxed/simple;
	bh=zoDazKR4am3Qud2rzuiXX6B7CUykUfYjPLvMCjP39wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOW9y1EFfMqFkpUiYO577UQzPRHtQuiXdGTQEDYqoyV59x4+KUMzZKAYZVfaWC5IsNUlsOju3pHn0s2jdyg15deULcLX6CjKfgHRkqRjH7Bq8coomgHFDlXLevqTXE4BmlUi7Jc0kKQ5IGkNCq3pfYa9BlJ8pPBiWUTJfPMVed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9Rs1njb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUrWMDg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9Rs1njb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUrWMDg6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UExkML2391342
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 19:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gjZmNNPHmNuHOeGribBaDwRd
	i9Pdnrfn8eSrbuTd2d4=; b=I9Rs1njbL10R7SJ9bmaOSCSD9AX0zxFyjrsIUezs
	zIntxRO1qyFeHJo+FPmmHYDta050M1G8gkn6Sgp6ylVvuDRzyRmnh064TQXN1idP
	dgTW997pr5RqlJ98xzZ1Aoeg9bAL192jM+td6Wgz7bgd09ac6c1kuyfiAyeorxp2
	WMtfbmSxklx7vX4EHPYowZVn4WCt7KBbYKgOQASfy3Xs1JEmo5LbAkukLGgG8Sy1
	lkOXDVMeTJydV0wKpsdcRx0RwD/tpQ0+e7ldypunXffosvJ7PYxDCDkbi7hIoJzT
	Yw5lY84tTw6edpBZw6jDClU6DgQKKTMlro1OKy/dO/Lnkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7h3sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 19:38:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso65781901cf.1
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774899519; x=1775504319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=KUrWMDg6nyIL6Lfp+u9imbRqmBJu2SWjjcaAA8pW1ynvLqMcV1vJen+veL60Z3YK2k
         5iHkxVqTnpzCa1kPPT7MSdSyeGvKXocvoKu8vYXRyM/yx4/EYyj6SBS65/nJ3/T3p/Ya
         GU7LH/AbP2fTxu00s5rzm5gv3BEnRwzCcuLmJndb3NBHGbdG8QlWsiFr3WwWrD71z63B
         xkggL5RcDnnGBdQfbQh5m7yPWa10B1FOrQdv2wiZNgoUI/Vy0P0TKJLHgPYJ/m064mKV
         LGHkW/arSgriOmONfQb6CRKIVtNlInPH4LWdkSyQu+wIUotjGV9U/E7k+tO8a8YG0ek5
         6Gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899519; x=1775504319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjZmNNPHmNuHOeGribBaDwRdi9Pdnrfn8eSrbuTd2d4=;
        b=X/9HXJZvpz8hcEQSfHx8/wwJ8128cQ5Gw2RgD8tYF1caQwksuhaY7OME1gnjfQTuAx
         6SokVYQFok2ig+/70kJQAidb+2aRPPnL0NkxQIaZNCG+70cVm8Ypjal35f+JQ16J+JV+
         V9KA0mWgmgcryTtLBiuQkVVQiBM09eq817/OT7tClZqJh1qIKIjkHVL9bYKxOzsZqjBI
         DaYEwOvWXAPMdyo3I0424gV0tXHpm5eCcExwNae78HP6PtH9uHAqVs4PiOX+LXpv5BCV
         ZlzQ+Jn2TIz24upabTd9tIjFwbXaa1zV04tkFtVD3y/GmjtAtPPpLjfJAOfvoDq7cSnG
         LBWg==
X-Forwarded-Encrypted: i=1; AJvYcCVMbODXcHkUxFn991vfb14HOu+Bg36tjHMZIojXKaxe3MmeErJ///PdsIZavUDpdYCt+16XXHTPOz0LMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDcUjZ9fBM3KytCq7JXJobm3MwC4/3yx5s0HW7pSRnvBZnIRrv
	qTDMgN9utm/ejoEfswPDHU88nIUFlvfe+NNDTES0NkOykpXUdtr7efYmSfTiyZ/ittwexYeV3PG
	plS0JZpoLStx8Na/PyM1y9IxS1D9OpRoq5Hl4E5K3vGKqDYMpNU40xpR9zE4z5/Ic3v5osmsQ4Q
	==
X-Gm-Gg: ATEYQzxYu+/yXGmdM7zPlIzMWJzgoKFvvuoEtODVeQhSJy01hgp+Inv2W5bSxumVimQ
	8lwW+uEQ+S1ZAqOvGCuXMoMtj2A69SV9v3GViMlGsriZV7tMTYSQ2OoMIEl67MOl51CnXMsP1Dq
	xEHNFL2xJHikLynEwACeWlTQ0RNosBpUcBMa+c0D9Yv8BPaM9ziH+8rxx6GjIjTUkusWQB8tR2W
	Oe0oMwKgnyvlA2GX4V2EtNkL/ftSQO1M91L3t6qYI3ICoAWXn4uh3ZcljyN9IYmrOT4osfX4ZEP
	/tQZk9kvfpe7VYaQjJi/F1GeHJDlAKg9pB13U5tI0lJY35jeFlIpwyOxzpvA3RhBIfYLoIBv8k+
	1Ouun4TLI7Jsy7lju3TSAIXCDTNutLG8esQigRMRkcS8zlKGpa4//iTqLwJwqV+uHEvQEtDaJt7
	y2KxRtnnNVHaJ0DNRoDGGBecNESsW9BhgM4s0=
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187520921cf.54.1774899518869;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1386:b0:50b:1e5d:992b with SMTP id d75a77b69052e-50ba3960fa2mr187520461cf.54.1774899518260;
        Mon, 30 Mar 2026 12:38:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f435bsm1845067e87.9.2026.03.30.12.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:38:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:38:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: david@ixit.cz, Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap
 QMI requests
Message-ID: <zk4b5fq6qlduj4sthdealnfwsb7iphq5wform3mhaij7pcin3a@2dpx4yp3qxyj>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
 <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
 <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE2NCBTYWx0ZWRfX7bxteeFBs0MD
 NtDyMStYnJd3t10ViASRa6PXdmO31+RGNWT7arzeOqpE2xWwlaTVwCAFV/WSN9oyl1DPEhTHOmt
 vGPZDAS5VHlP7WdXwZ65nSeKq/LFWq/yA0bqDwesBhRvtmMti1K2Sj26iXY7IS2e8xu1Tgy75ji
 OXSVqHYfOHn3NSA//PXpCu6InApA2/dqO9FqTSSRD/NRfe/2N1/aIZbQIeQvCMhd+YSCl83goVB
 Ji1HCCk1xMG8g1EyhpeDiPzm56L4QqqWc2Rz5k/hpJ0O7HPtnK1xmTdrbzhbblTyim/cVrhhH9i
 93GYQsO+hyTsAc736qcak7Zauhr1qLRhdf6FErqSVzNnMGu89K9G3QHqNW7y1n4joqoEg2bvt+/
 urpw/fWv1/bnQVUqqU9ve5s2jkRgwwi0KPAlTiqYdwA0IRiAryitHfvXgU/6cfzNy7EFN/brvIF
 Gywudnu1tanzfby9fog==
X-Proofpoint-GUID: EI8s9RhfSa_NmVt-rThsu2f4yD9jP_Ax
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cad140 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=RREYq0h8bjQH8LoFo6AA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: EI8s9RhfSa_NmVt-rThsu2f4yD9jP_Ax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300164

On Mon, Mar 30, 2026 at 11:56:16AM -0700, Jeff Johnson wrote:
> On 3/29/2026 9:26 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
> >> From: Amit Pundir <amit.pundir@linaro.org>
> >>
> >> Some firmware versions do not support the host capability QMI request.
> >> Since this request occurs before firmware-N.bin and board-M.bin are
> >> loaded, the quirk cannot be expressed in the firmware itself.
> > 
> > 
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Jeff, to my knowledge this is the best approach that we have to solve
> > the issue on those devices.
> 
> I'm ok with this approach.
> 
> I need DT Review or ACK on the 1/3 patch in order to bring the first 2 patches
> through my ath tree.

Yes, of course.

-- 
With best wishes
Dmitry
