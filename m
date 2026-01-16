Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E208B1EB5E3
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581256; cv=none; b=BuWMDVH+wkyxNIP3LfXp6iOmL7DQybWADN0zPVAlq/2BjS8kIyGaGPg0tXtb360LEw77ViPs9DBIwxCz8pRM6reGWpyq6GU6NyV3uqxJBPhLuo5mFAVIhYygeoDvhO65k/bLpajCtKYo9LHv3Hut5JHzmzNRZZCW917SJ2OexFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581256; c=relaxed/simple;
	bh=q74+5ZnUwcdx1btcAy2zqzv4xpPqKeKYliKs8FQFcvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASlSU3mKjA+xEYz7kaLPOuQ6t1OC+EBm2NP2VH9ghnDzYbMkQHuoDeSpNDYE8Sxj+tGLzBbmmOVP1RrJKz15CKghks3PYchsQc4fpO4PFVinyInHCRLmLPYn6oyk84YZkGlWlZfTIq1KPKG7NX1eMu2T4UhkAv/s6AS5gxLMBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlklGxgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wx5Y/UfI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlklGxgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx5Y/UfI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDZjvK1196336
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ibXM/IJs9WDuZYSVdiNej6sR
	HQ0vHmfue7ThjW1H/ok=; b=BlklGxgXzEpdrHjixzkmtBz5qOh0KAbcMtdkXqLf
	thqtFeDPUY0ZsYsz821bAIawLyT6WN1MZRD6cwJUzSCgC/YzTYAWUJegDG4iVnIC
	17fuY/iUtlI7EObiMSOGcKL9MR+QsGeSj7toXEv3WOscKFWmtzTeo5trtJ2IPcav
	KR7l5iQ3y2tpMdJqgaNGAZkj66Sed19vhNQ+1Omm1Yr7Ydb2T0Lw+XRmMDmRQE2i
	h4L1mwgYQyCnH3w6WfXfHyySci90LAuxZCuuq+12j7wJOladCRbvxGhDEhY/EEYp
	8hkXxzPYoJqk0oh87VMPfvI4p/a1WbLAVl3i1HjVLb+7Ng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqpbr0gxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:34:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bc4493d315so627048385a.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768581252; x=1769186052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ibXM/IJs9WDuZYSVdiNej6sRHQ0vHmfue7ThjW1H/ok=;
        b=Wx5Y/UfIFLTOoi32qYscrXw75WFj1apllJFzinR1rTEojY6eKrNAZyVPfk2S8pHuU+
         mq5oq6UEOyilijxVgpL7PzIwkoXDjt8dczU54NMQFEMn8fqRM4ZIFT7zWlDf88ocKVSO
         VgQurAG30zDL2L0hr/lJqAl/WtuE/2pca8qldLqer5ajIuJdKJujKfQyX7ODIF2+WD4a
         KPXj/Mbuiymay83paXpcWDSus77uZ85inlP+W9rBLeBQWz28odgu/HH5/Wu5SPgkhNbi
         Woa/eg4adycSLd9V5y+lTsrjbkipwmA70r0NjY/ktIzxx+3Iq5Q2QScVfyeDZEDpFhZR
         Ptqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768581252; x=1769186052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibXM/IJs9WDuZYSVdiNej6sRHQ0vHmfue7ThjW1H/ok=;
        b=lOk2PNVuhTj4ObFXccYURn9AdhAK9OOpd/XurwRFKLfe1nP4STrXeLqdJ6LMDvGrdD
         ezUar9BaTkEhdAcA7BzTl8QyaS9f6fyJhWEa1tD4Dfmg8qbzukAQcE+DIPMXtJhpF3Zn
         KKUTUuBrgSyeVKmEmZtfj+IrOv+BPm4h1UcDNn4LbaQ2TAk8/W3q5IoNkWf28n75KbxJ
         mW5gHYsuzq2e4KS8C+1mi3Zd8Gtd+znt73gq/m/8m0wHJv0zmwy7p5p5ksqQWfv32TwU
         tPDqsO4PxfRRrkr40jMEP3YK5+SG5T/8/yYxX2IwBD+Jf17XBEtqJ2GgvkZ6KlFSmcOm
         SWEA==
X-Forwarded-Encrypted: i=1; AJvYcCXLJpu/moiQeZvlM4vyxZ5f/NQARjYXEi3BrwM1qv9Mj5OtWoPfM0+CJDvcCN9fTi1YZzlfTZ5iaDUhNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1hOdptEED00j0w71Run9GC2SICtNuZ/6rRzXnbuD+xWbfNfqQ
	pIGtxHQvOFrHCkL6/7MIhPbMMAwOeJf/v7Y3wBI2y3mW3DIc7O+AN8P8y88/8cfdG1iE1RFTS8v
	gTUoJl/8zUAyk1xNV5nY5lcL66O5RBz8apSknkz8iigUFRQxWSiclNVEHN/eEB32HDA==
X-Gm-Gg: AY/fxX5To+ohXe4HWHNMYZK1IkKXUqd8rHJJz3672ovRHhftrO9QjcW+Jj6tN5WtIMS
	Xgoex+QRp93fbhXi0pUB0XWntJZYEv9vVZ+H1/jeTjgJe8MERzn1iJB/nfg8cKy7Kk2FRxM/55M
	ZwlMT0EA0J48xVu4FwGWFVUMTEjNlUXFwNAyS+TB3q3YdTjqss4bRGRHSwK9H14usillGObss2g
	5VNSTV6fd229xwZNc4GTAY+AexDWVQi2+1cyZsynI1/KeikK09/eAnWgJ6pzfnU5RxBFZVYF2H8
	zUXOBv9iG3/Jn+IFckMUAQ5tzhk3pNo+frun3XETmeUfLhG1oVN2p9ddAs3OtCpaj6QQf/zPW8R
	YU15+G0T3J54RFtARV7zZG0YzXbkIWjqMSh/sdDjv89zukB1B7fuFTvrBRNkPPH3Vtx9rP3541q
	2IVywM9ovkl/Z2oaO/EPu8s08=
X-Received: by 2002:a05:620a:454d:b0:8c6:a22b:e135 with SMTP id af79cd13be357-8c6a68e828amr459905985a.36.1768581252232;
        Fri, 16 Jan 2026 08:34:12 -0800 (PST)
X-Received: by 2002:a05:620a:454d:b0:8c6:a22b:e135 with SMTP id af79cd13be357-8c6a68e828amr459900185a.36.1768581251735;
        Fri, 16 Jan 2026 08:34:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm905003e87.20.2026.01.16.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:34:11 -0800 (PST)
Date: Fri, 16 Jan 2026 18:34:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Message-ID: <cdtaituwzxzhv653ahzfmrcux6emgmrnpp43xzs45e6dsy3uls@vefliexuk6vk>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyMCBTYWx0ZWRfX2oCoB+edNW2+
 hRxne7525rA+UF79aV8khxCdCQsG13OM1Hk0qb8tw/iC44uq5NuQb3QMcjePmp33uddMzGC9Vi7
 nJo/2PSc7mJ2uFeVbEI0lW9ch3nQcqSR0Q1Mbn45K76EY2MM8UVzM/A1bGd3Hx/msSerzcp4GXu
 rJDEBQvBaZxMGCZSztZ8ekm/+PpWQyJFRACNSSbGNstL2BiVqbzgtWBxZsgpNgrrmTb07ZVBILF
 A/WjxVQ03NI7+hPCdzk9TiDriLNRvmnZbkMrbv22yxDvLdhLQHltj89ReSpYrjaJnXlsSBs+bn/
 29S84XyU6D/AsuF0tqiBt4pMFIc57mSY5kki1ONGnVw7w8lOEGkFXOSgkEeCmDC++CCgCwehnT2
 w2gNcO5nq6p+XFkueNouCzxODL8vye1m3tq1918Hfr90ZNqdwDEERK/UMqufN8rzeU7HRZTuvrb
 a1drzSml2FX+FgxemdQ==
X-Authority-Analysis: v=2.4 cv=dL6rWeZb c=1 sm=1 tr=0 ts=696a6884 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=uEvfv33MuhQ9VhGiz4IA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: utc9WjNPomB-2eHP-xLpQCYwGFYvlApu
X-Proofpoint-ORIG-GUID: utc9WjNPomB-2eHP-xLpQCYwGFYvlApu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160120

On Fri, Jan 16, 2026 at 02:17:23PM +0100, Luca Weiss wrote:
> This GDSC requires an interconnect path to be enabled, otherwise the
> GDSC will be stuck on 'off' and can't be enabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-milos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
