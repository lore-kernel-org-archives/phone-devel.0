Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156CE4AEE2
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408736; cv=none; b=CO0mAJ30qTItKRUT/D+H+QT3JgDYNn+0kRVUkXhXP6ywN5eXiX6JgGOlus7WAxp5vYLEPlssAUz7dWlESluZlgnK0AHNY41R7sg4tNGn+o0qRoKbGGfwb8vEbX/pCXTHW5Dv+uT/+P1ZjWxePqA+LSps5j0OKuMC35nuqK7RQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408736; c=relaxed/simple;
	bh=L/fbNuXjYn7XsRJDxzHI5vUb2BDiq7dkEs8JRNhYZVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKMeZ7xP3lpPPV3MIbGvHCUmcPTj5J227ouQF+xgyCBt+VLQTYAwFh4Vl4scG6gAyqDaQFoXpiD+XXMIjJE8VMddsqBfckZsbdIgrYdibbBjMkKhYwcPSTDSJfur0O0WaEZ4BjJ/BYBd08R+BVm7NAmJE13RBf7ShOnZ1tJLIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxglNcNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHsIKnbi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxglNcNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHsIKnbi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMg7cj2787794
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P3t6OHpAQZ7WZMhx/RTKrRQz
	SrkeOVJeFRjxYYk/5QI=; b=GxglNcNTlqJeMYdS8Tu762wM2Ojiqd4nLyFk04EV
	4a4Ts2rRjdzMvtdjWM7BefspqKHONLySSBIBaki9ZZpES2vDA70hdTzxk1jKtNqo
	kPTDIld8GgO7Z/Pv7/gUSQde8txTPJvmMPWAGuavF5qSQy5Ht+qROEqxmW7hPETi
	HipfrTNFywYLTMVf9TfKV4Qzct8qXL6i2Um7EVvwqfsFY7e09QZ5rQaAqPB/d92u
	AzZXBYLD4JjIZezc+CNGDer1qK8rmFM5onm5BXtnbbD3XKPzWMoLyI4LIsGNtgKA
	+7/Rq4hF8DAZyq3BREw+0JPDI/afsoYewwiIRvnMpexY8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw43692-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b878a8c07so3948991cf.0
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774408733; x=1775013533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3t6OHpAQZ7WZMhx/RTKrRQzSrkeOVJeFRjxYYk/5QI=;
        b=MHsIKnbi96Cjp3SHvvvXuJjsNypcmCDXfyGlSIQAq34u2XFuqS4C7+ISvtkOJbJSJT
         nHuIqCdrtpzGtQfpdvK0/+SlnWmALhyFPBjZ8U+yIUvoSH9DURohhxN5W/R8pV4WtCXW
         IOZp54brI4HDlHSLMAW+C8/3vKQSqZ7A5R/CH5+s4++hVIBlTntPIfWfK4uWR/xj6tIM
         pn4MSMew4npfIXcfS1SqJgE5469SdztAyAmYz8xoQyLp7M8boFgsF0Y3XKmG5J+jS+Cp
         XPx2XOO58BxML3s5sUqNiGx/CyumWlJSSYeUWftSF+i7ML8s85g+pzYG4AD0Jv5rqK2e
         4B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408733; x=1775013533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3t6OHpAQZ7WZMhx/RTKrRQzSrkeOVJeFRjxYYk/5QI=;
        b=X0Co06+UiWMV2PMSBFefbVbL8XSg0tmV1eYRunpxwIHmR8i+XqYtOR7ZaYeSdMv3ip
         FVwnu/UU6Wx/IMFOQMKmId0YLZz+FZ6cv19UkeS8sGVmZwdn/7nTyvTezLHkyYhoYst/
         wPw8jGb9QYo/QTHmhAfntKioeTW5jh5iV4g50X0+dtMUMeJxjUF5TneErGHANMCvPlNw
         2H2/KIN2oaKHi+oWO/UItN9gJ54U6XnafSIYHReCXsTyxFv1BGMP8/CLrvkKpXPZHv4g
         dgEloFakh0xDXUNAaVS7p44xrBy9w/NaLq6MJoyNDmth4uABzvgRH1IZgbWs9AOpK2dH
         UYwg==
X-Forwarded-Encrypted: i=1; AJvYcCVk62gzrYto8wMOcZ0ieZJm/FMbovWVLXuy+pzs1y6A2ksdsUjY3tINxdtFxsLyWvySfT5aZahIYugRyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypAl56VjZza3pi3uUnqGYykIffgsHQF+C2wcnCVE8nXU4TtKti
	qe1WR57vAlPu6XGowyy8mGBu+N9hpaTZCj46RgbbLVQo+ReOJ9wi/1EehWssFN9atzGqMFd71t6
	GzgVXzoDzlUyGvFq/I0Tc+vgrOtlU1wj4qwjMTdvANRVVcV8pKSmcYgp7ygyYfKQqYw==
X-Gm-Gg: ATEYQzzj0h6nK5vrcjyQL2PUZbZob6oQRIlhNECD5qZ7oOzxlbWRs0bvZ0rYBJwauQm
	7+2aZlfqjOcMVclXDj1jNt387htcMzn37h84WIEacqTn2DNLlit8zvfHHQ/xUhpMxH4mdk7MxvJ
	7H1YNlwUkvmclndoVWQWWUylb4UCskztaukICqZa0cOnEvuN/6ejP0L5/DqBf4ob1eAc9/5iOf3
	P9P/TyP6bub0QWVQFGOd/mqJq8/mo1+sUgrOeMido2+c5hZdfdEwk4JFHsLGPbatfmFcpE2zUPb
	3EjWby6QEJKNYaL/sFVOYzz39TA3B9ns5je/VWSbNt0V8rPX2nh7h2sue6xN4p5cuySiVmj/UVX
	Yk2qUtBbhWwVz1GVmrSN+YbPi1rAecBKcHJGejuv9Xk9JIhUeUB6v1E8Q33VrF1rAHbOODXX8/l
	2B//nuPVGWvqgS4/HDL4TlrwUokft8lpg2+xE=
X-Received: by 2002:a05:622a:1486:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b80e0a275mr31300031cf.46.1774408733574;
        Tue, 24 Mar 2026 20:18:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1486:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b80e0a275mr31299811cf.46.1774408733116;
        Tue, 24 Mar 2026 20:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf960dcfasm37894941fa.0.2026.03.24.20.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:18:49 -0700 (PDT)
Date: Wed, 25 Mar 2026 05:18:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <eczuhmxgclyc6p5vj2e3vtexm4n25mpjkfinqyx6wb7yeddcco@thahz4f5lmhg>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
 <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMSBTYWx0ZWRfX+YFkPAu5PQVC
 jtYHCDBM/VxREOGBI8Ex61Yz3VujqOiqokDmOyDdMN0LWoiegxXyGEGhjLfEw2E+/pycR3kTsCv
 ok0wQ0sDPESVok1kjoGrYQiHwy0RMDPFpuYJvm3WrrAhj4VnUFPjdRYXkmMCXOF7K9i9FSV5gVp
 9UEGO1PQx6m5cx7dDH+Xrpi+RNy56XHPudqulHzPPMfrls0+vPlkcjDFSLEUMOGxs9aqT9U92Ub
 /M+8twSW7i8Pb4R5F04Cb9st1Sc3ST0DQrWanystdHJl3utKrR2+TavNwpcnlOPvnG/VCw6Os8b
 IKW+SKBVW5YNejRS4YNKaW6yOzdHcbYrtxZCLmf85IUGdRqaQrAnLAt445DXP3xb/9/C/fEu2Qd
 Qy0BzMyBflETb4fw/Xrs19Q8Zy/VD/Vim3OqPOuOiPtatGc6vHzK/pjnQ6RohRVSjsMHwGvJtkS
 DW17NXpprQeYDCLGCvQ==
X-Proofpoint-GUID: I9RO-0qzrvIETRPie9dUXUjZvVveTQu6
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c3541e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=q8gErFrpIn0Q9GUK0HgA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: I9RO-0qzrvIETRPie9dUXUjZvVveTQu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250021

On Wed, Mar 25, 2026 at 02:03:47AM +0000, Paul Sajna wrote:
> March 24, 2026 at 8:56 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > >  &ipa {
> > >  qcom,gsi-loader = "modem";
> > >  + memory-region = <&ipa_fw_mem>;
> > >  +
> > >  status = "okay";
> > >  };
> > > 
> > This looks like a separate fix.
> 
> Should I put it in the gsi-loader commit, or keep it completely separate?

I think, together. 


-- 
With best wishes
Dmitry
