Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E924633C
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017337; cv=none; b=QQ+0W6npKj2zqQFIDdGivwODh68aQjYD18ok1sF2S4l5TkQkQIbEf+WRjBzpBssxSk5zeXCq+7djc06+P+bItFmoOvL+m4iwIrcCjIdpmUSViTgC+RXa8LWb2HQBmrigdWre9jCVOGBoA5dqWn5ZOJLCItG9lWE7Dr+/W2jNNs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017337; c=relaxed/simple;
	bh=Cqy9wXz4Md2dDfVYMq63yQ8yoiIG7qVCmGKjhWNBpRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sL4h8YI5qnhr0ZCotM3eqg0xPNW1s0JyGLud8WJS532vpsiZ14xQvZV9d1g2mGAxcYiGvyJVXy3cwXSRkNKXefyOYdqcqTDf4xger+UVgud9/ELit2m4c5mo4850zp6w3honDTlczRiRRMq0Yi/HCo8GlJuazxJ1EUcKmTq24B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9qyvpnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9qyvpnG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IEvujw022986
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 23:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/rCdii3k99QNyH4v5GZVV/R
	W4IUX5b1L2951avVf88=; b=b9qyvpnGQUYzs2i7Mvx3EouHvPtEV06WOmwA/7FQ
	Pr5fPVwJ+mNV6x9NS/Sy7Wdz8ur5/zJ4uVxdYLTnCEIJY/J1kIfNZqgNTkdrJ07v
	3eiN+0Nkc3qAV+G6puOnH6538Ns3hMTLp62ddy0ffTkrKOQwj4S9ns+IgQ3rgOcs
	dVTBxatJdDzh6kEDZL/npaMw/3zHQ3UKbYSz5/GN+o+jwjVvr2ai4HepTDcTMg6a
	ImRpewDN+O19KA9PCHF3MibhHh4Xh+iqhmYeKdNqm/+DpMzIKXlwDlrlbR/+LVgT
	0mgQkQada8idVQsx0h0tAC03cvX9xcuoYYERsS85BNKEWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq2um0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 23:02:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c77aff78so711875085a.0
        for <phone-devel@vger.kernel.org>; Fri, 18 Apr 2025 16:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017333; x=1745622133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/rCdii3k99QNyH4v5GZVV/RW4IUX5b1L2951avVf88=;
        b=TBwcTZsp4FNa8pStlm6wSp95vUycXGgdi4/fb+BOMTZMGQQsUtWfbhxWTG3H9JNJ4K
         rMGr0P0xGVFhB5yRLG0mMmvuzcTMcw5XTviOln88MHzLD3egEVjReglNnXBF2M7StdMa
         XOqUYucBaAGKAjFN9TvNs0Q4jsWCecYqFenRoeJvFcNSLf7WJk7ZZreDO/qA7/2rTXiM
         fHv3jUxjHnqtLMKNrKFQkCQzlODPlA8VT9tZMBnEgGlS1G+kvdeXcf5OOczXk1bHqZx3
         iXoPffC2EOgYfKoRc3ZudfoSbmKSh/hDAd5BCI09xcYYyqbb33hgE9JlP6uJhK8P0Te5
         W3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWMBwB+2A4qgFzQpIW8XLo+ssNjUwuuG1LAlfSFz0bQE4ENnUsWB/yvyxpr+gccHnfZGkADvx16dp/xZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVNkF4YjkBiywKYVyNoAGjenlWtZ4gXfWDVwLUOvEmy4C9ic/o
	qgWIGsdp5Jt2uuGo2Xux4bOVQ0sCVqDPVUqfrd8zBRq6KfXTP8xiIthve1tNiihsuQ/dmRrz5oh
	abU0imST/U5uNJZJ48NkA/KZbLtLtLggAmi7w1+ZUkjqBXi0QblNatKgb/Otwig==
X-Gm-Gg: ASbGncvkcoR6aCCl2r7T1GJ1EhR79itqV49F7rL/a7Ia2fCrU9xUs/OkgeeLvZlSWUF
	q2bRSaWfY3A2WryNChZPONjCL38j0ZGl4Gj+1e/otMeWoPEsfYbwdWmz+3ojdHrD2g76KGxY+9u
	Pz1+X0sB3+PLAxD6qI2tNM1viCzOIE3Jm3P5XSJpAQsvltvpAzYNtQIQBji9bDh1hTeFGl2bF6e
	ifHVCnMjTRvxnGR56oPfARq3WxsWD3ceoBe5W9/d/4XWUaBhd3b7137esUhgMBZ/zDGEpW0tp2e
	BWAFUB9iZWe0om2WdD0+qsJm5tI8bmTvYXv4W67yLq+xIRFZo56eu1m6MJ5JHjL5POQ83sUF004
	=
X-Received: by 2002:a05:620a:170d:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c927f80556mr697465185a.17.1745017333593;
        Fri, 18 Apr 2025 16:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOvHKeAZS5vASogCzZeo+qEyJxQ15QLGhBMc3CRYTpJqeXQEMRI79G+EUi5azW028Wqu1vaA==
X-Received: by 2002:a05:620a:170d:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c927f80556mr697461685a.17.1745017333209;
        Fri, 18 Apr 2025 16:02:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e5163sm290371e87.184.2025.04.18.16.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:02:12 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:02:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
Message-ID: <j3xylbgcvamtiumndssy73h646vwwdfyxju3t6wtpfhcd4f6fw@qgmbrcz6njgk>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
 <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>
 <D8V75HO8O4CO.33RMUJLKQ7UG5@fairphone.com>
 <D99SSJAOJE3V.ENIEJ9IWFZLF@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D99SSJAOJE3V.ENIEJ9IWFZLF@fairphone.com>
X-Proofpoint-ORIG-GUID: yoEzFE_ZZTvrZifbW0gA1L6GB__fplZ-
X-Proofpoint-GUID: yoEzFE_ZZTvrZifbW0gA1L6GB__fplZ-
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=6802d9f6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=eUQzuGhTgxr9iOTw7QAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180176

On Fri, Apr 18, 2025 at 03:27:22PM +0200, Luca Weiss wrote:
> Hi Krzysztof, hi Dmitry,
> 
> Any feedback on the below proposed patch?
> 
> I can also send out a v3 with this patch included soon if that makes it
> easier to review.
> 
> Regards
> Luca
> 
> On Tue Apr 1, 2025 at 11:32 AM CEST, Luca Weiss wrote:
> > Hi Dmitry,
> >
> > On Wed Mar 12, 2025 at 8:06 PM CET, Dmitry Baryshkov wrote:
> >> On Wed, Mar 12, 2025 at 01:05:07PM +0100, Luca Weiss wrote:
> >>> This series adds all the necessary bits to enable DisplayPort-out over
> >>> USB-C on Fairphone 5.
> >>> 
> >>> There's currently a dt validation error with this, not quite sure how to
> >>> resolve this:
> >>> 
> >>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> >>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
> >>
> >> This comes from usb-switch.yaml, it requires that 'port' adheres to the
> >> /schemas/graph.yaml#/properties/port (which forbids extra properties).
> >> The usb-switch.yaml needs to be fixed to use port-base for that node.
> >
> > Thanks, do you think the attached patch would be suitable? It does fix
> > the warning for me, but not sure if it's too lax or doing the wrong
> > thing.
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > index da76118e73a5..9598c1748d35 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > @@ -26,11 +26,15 @@ properties:
> >      type: boolean
> >  
> >    port:
> > -    $ref: /schemas/graph.yaml#/properties/port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> >      description:
> >        A port node to link the device to a TypeC controller for the purpose of
> >        handling altmode muxing and orientation switching.
> >  
> > +    patternProperties:
> > +      "^endpoint(@[0-9a-f]+)?$":
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base

Please document that the only permitted property here is data-lanes.

> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> >
> >
> > Regards
> > Luca
> >
> >>
> >>> 
> >>> See also this mail plus replies:
> >>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/
> >>> 
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>> Changes in v2:
> >>> - Move adding "*-switch;" properties already in earlier patches
> >>> - Move wiring up SS USB & DP to SoC instead of being done in device
> >>> - Pick up tags
> >>> - Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com
> >>> 
> >>> ---
> >>> Luca Weiss (3):
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C
> >>> 
> >>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
> >>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
> >>>  2 files changed, 104 insertions(+), 8 deletions(-)
> >>> ---
> >>> base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
> >>> change-id: 20231208-fp5-pmic-glink-dp-216b76084bee
> >>> 
> >>> Best regards,
> >>> -- 
> >>> Luca Weiss <luca.weiss@fairphone.com>
> >>> 
> 

-- 
With best wishes
Dmitry
